// Tim & Jonas V1.0 -- running from within the cody project directory
//
// Johan: v1.1 -- using path, creating a startup file in the root dir of cody projects, ...
//                this resembles the hosting setup.


var readline = require("readline");
var util     = require("util");
var fs       = require("fs");
var mysql    = require("mysql");
var path     = require("path");

var rootwd = process.cwd();
var codywd = rootwd + "/node_modules/cody";

// https://gist.github.com/tkihira/3014700
var mkdir = function (dir) {
  // making directory without exception if exists
  try {
    fs.mkdirSync(dir, 0755);
  } catch (e) {
    if (e.code !== "EEXIST") {
      throw e;
    }
  }
};

var copyDir = function (src, dest) {
  mkdir(dest);
  var files = fs.readdirSync(src);
  var i;
  for (i = 0; i < files.length; i++) {
    var current = fs.lstatSync(path.join(src, files[i]));
    if(current.isDirectory()) {
      copyDir(path.join(src, files[i]), path.join(dest, files[i]));
    } else if(current.isSymbolicLink()) {
      var symlink = fs.readlinkSync(path.join(src, files[i]));
      fs.symlinkSync(symlink, path.join(dest, files[i]));
    } else {
      copy(path.join(src, files[i]), path.join(dest, files[i]));
    }
  }
};

var copy = function (src, dest) {
  var oldFile = fs.createReadStream(src);
  var newFile = fs.createWriteStream(dest);
  oldFile.pipe(newFile);
};

/**
 * Look ma, it's cp -R.
 * @param {string} src The path to the thing to copy.
 * @param {string} dest The path to the new copy.
 */
var copyRecursiveSync = function(src, dest) {
  // console.log(src + " -> " + dest);
  var exists = fs.existsSync(src);
  var stats = exists && fs.statSync(src);
  var isDirectory = exists && stats.isDirectory();
  if (fs.existsSync(dest)) return;
  if (exists && isDirectory) {
    console.log("mkdir " + dest);
    fs.mkdirSync(dest);
    fs.readdirSync(src).forEach(function(childItemName) {
      copyRecursiveSync(path.join(src, childItemName),
        path.join(dest, childItemName));
    });
  } else {
    fs.linkSync(src, dest);
  }
};


var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

console.log("\n在一下目录创建工程： ", rootwd + "/");

rl.question("\n1) 输入工程名： ", function (sitename) {
  console.log("Note: 同样使用 " + sitename + " 作为数据库名。");
  console.log("Note: 如果使用 mysql 的 root 用户没有设置密码，你可以直接输入enter键, 如果忘记root用户密码，请参照： http://dev.mysql.com/doc/refman/5.0/en/resetting-permissions.html");
  
  rl.question("\n2) 输入 root 用户的密码，mysql 接下来将创建一个新的数据库和用户：", function (dbrootpw) {
    
    rl.question("\n3) 输入新的数据库用户名： ", function (dbuser) {
      
      rl.question("\n4) 输入该用户的密码： ", function (dbpass) {
        
        rl.question("\n5) 输入该站点的名称： ", function (hostname) {
          var con = mysql.createConnection({
            host: 'localhost',
            user: 'root',
            password: dbrootpw,
            multipleStatements: true
          });

          rl.question("\n6) 输入一个站点文档的存储地址：", function (datadir) {
          
            console.log("");
            con.connect();
            con.query("create database " + sitename + " default charset utf8", function (err) {
              if (err) console.log(err);
              con.query("grant all on " + sitename + ".* to '" + dbuser + "'@'%' identified by '" + dbpass + "'", function (err) {
                if (err) console.log(err);

                con.query("grant all on " + sitename + ".* to '" + dbuser + "'@'localhost' identified by '" + dbpass + "'", function (err) {
                  if (err) console.log(err);

                  con.end();
                  con = mysql.createConnection({
                    host: 'localhost',
                    user: dbuser,
                    database: sitename,
                    password: dbpass,
                    multipleStatements: true
                  });
                  con.connect();

                  mkdir(path.join(rootwd, sitename));
                    fs.readdirSync(codywd + "/doc/empty").forEach(function (src) {
                      copyRecursiveSync(path.join(codywd,"doc","empty", src), path.join(rootwd, sitename , src));
                    });

                    fs.readFile(path.join(rootwd, sitename, "empty.sql"), function (err, initstatements) {
                      if (err) throw err;

                      con.query(initstatements.toString(), function (err) {
                        if (err) throw err;

                        fs.writeFileSync(path.join(rootwd, sitename, "config.json"), JSON.stringify(
                          { name: sitename,
                            mailFrom: "info@"+hostname,
                            hostnames:"localhost,"+hostname,
                            db: sitename,
                            dbuser: dbuser,
                            dbpassword: dbpass,
                            dbhost: "localhost",
                            smtp: "smtpmailer."+hostname,
                            version: "V0.1",
                            defaultlanguage: "cn",
                            datapath: "/usr/local/data/"+sitename,
                            port: 3001
                          }));
                        copy(path.join(rootwd, sitename, "index.js"), path.join(rootwd, sitename+".js"));
                        fs.unlinkSync(path.join(rootwd, sitename, "index.js"));


                        mkdir(datadir);
                        mkdir(path.join(datadir,sitename));
                        console.log("创建 "+datadir+"/"+sitename+"/");
                        mkdir(path.join(datadir,sitename,"images"));
                        console.log("创建 "+datadir+"/"+sitename+"/images");
                        mkdir(path.join(datadir,sitename,"files"));
                        console.log("创建 "+datadir+"/"+sitename+"/files");


                        console.log("---")
                        console.log("站点 '" + sitename + "' 准备好了。\n")
                        console.log("请创建DNS, 添加到 /etc/hosts:");
                        console.log("127.0.0.1     " + hostname);
                        console.log("请检查 index.js 和 config.json 来调整相应参数, 加密key, ...");
                        console.log("---")
                        console.log("用如下命令运行新建的站点：");
                        console.log("$ forever start " + sitename + ".js");
                        console.log("    或者");
                        console.log("$ node " + sitename + ".js");
                        console.log("-");
                        console.log("访问 http://localhost:3001");
                        console.log("    并可以访问管理页面：");
                        console.log("http://localhost:3001/cn/dashboard");
                        con.end();
                        rl.close();
                      });
                    });
                });
              });
            });
          });
        });
      });
    });
  });
});
