/*
Navicat MySQL Data Transfer

Source Server         : cody
Source Server Version : 50711
Source Host           : 192.168.177.131:3306
Source Database       : MyCMS

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-03-29 13:27:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for atoms
-- ----------------------------
DROP TABLE IF EXISTS `atoms`;
CREATE TABLE `atoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) NOT NULL DEFAULT '0',
  `sortorder` int(11) DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `note` varchar(4096) DEFAULT NULL,
  `extention` varchar(4) DEFAULT '',
  `created` datetime DEFAULT '2010-01-01 01:01:01',
  `updated` datetime DEFAULT '2010-01-01 01:01:01',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of atoms
-- ----------------------------
INSERT INTO `atoms` VALUES ('1', '0', '10', 'Images', '', '', '2012-01-01 01:01:01', '2013-11-02 18:28:10');
INSERT INTO `atoms` VALUES ('2', '0', '20', 'Files', '', '', '2012-07-09 14:18:36', '2012-07-09 14:18:36');
INSERT INTO `atoms` VALUES ('3', '0', '20', 'Forms', '', '', '2012-07-09 14:18:36', '2012-07-09 14:18:36');
INSERT INTO `atoms` VALUES ('4', '0', '10', 'Layout', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `atoms` VALUES ('11', '4', '10', 'Logo', 'ourlogo', 'png', '2010-01-01 01:01:01', '2016-03-21 17:54:41');
INSERT INTO `atoms` VALUES ('12', '4', '10', 'Header', '', '---', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `atoms` VALUES ('13', '4', '10', 'Footer', '', '---', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `atoms` VALUES ('21', '1', '10', 'General', '', '', '2012-08-15 18:55:51', '2014-09-03 10:24:30');
INSERT INTO `atoms` VALUES ('32', '3', '5', 'Contact Formulier', '{\"name\":\"Contact Formulier\",\"labels\":{\"en\":\"Send\",\"cn\":\"发送\"},\"alert\":\"nobody@mysite.com\"}', '', '2013-09-07 22:03:12', '2014-09-03 10:26:15');
INSERT INTO `atoms` VALUES ('33', '32', '10', 'name', '{\"name\":\"name\",\"labels\":{\"en\":\"Name\",\"cn\":\"名称\"},\"generator\":1,\"options\":{\"required\":true},\"reader\":1}', '---', '2013-09-07 22:32:45', '2014-09-03 10:27:20');
INSERT INTO `atoms` VALUES ('35', '32', '30', 'question', '{\"name\":\"question\",\"labels\":{\"en\":\"Question\",\"cn\":\"问题\"},\"generator\":2,\"options\":{\"required\":true,\"cols\":\"60\",\"rows\":\"6\"},\"reader\":1}', '---', '2013-09-08 11:24:14', '2014-09-03 10:27:10');
INSERT INTO `atoms` VALUES ('36', '32', '20', 'e-mail address', '{\"name\":\"e-mail address\",\"labels\":{\"en\":\"Email Address\",\"cn\":\"电子邮件\"},\"generator\":1,\"options\":{\"required\":true,\"email\":true},\"reader\":2}', '---', '2013-09-08 15:59:32', '2014-09-03 10:26:57');
INSERT INTO `atoms` VALUES ('37', '2', '20', 'A File', 'My PDF - 23 mei 2013', 'pdf', '2013-09-08 16:04:49', '2014-09-03 10:28:39');
INSERT INTO `atoms` VALUES ('40', '1', '5', 'Photos', '', 'xxx', '2013-09-09 15:41:08', '2014-09-03 10:24:24');
INSERT INTO `atoms` VALUES ('41', '40', '5', 'Photo1', 'Screen Shot 2013-09-09 at 15.40.35', 'jpg', '2013-09-09 15:41:18', '2014-09-03 10:24:39');
INSERT INTO `atoms` VALUES ('42', '40', '5', 'Photo2', 'Screen Shot 2013-09-09 at 15.42.56', 'JPG', '2013-09-09 15:43:48', '2014-09-03 10:24:48');
INSERT INTO `atoms` VALUES ('43', '21', '10', 'Image1', 'image', 'jpg', '2013-09-09 16:01:56', '2014-09-03 10:25:04');
INSERT INTO `atoms` VALUES ('44', '2', '10', 'Official Documents', '', 'xxx', '2013-09-09 16:03:05', '2014-09-03 10:25:29');
INSERT INTO `atoms` VALUES ('45', '44', '5', 'Founded', 'Founded on april 1rst 1984', 'pdf', '2013-09-09 16:03:16', '2014-09-03 10:29:45');
INSERT INTO `atoms` VALUES ('49', '21', '20', 'Image2', 'ourimage', 'jpg', '2013-09-30 20:23:34', '2014-09-03 10:25:08');
INSERT INTO `atoms` VALUES ('50', '21', '30', 'Image3', 'diversity', 'jpg', '2013-09-30 20:26:34', '2014-09-03 10:25:12');

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` int(11) NOT NULL DEFAULT '0',
  `language` varchar(2) NOT NULL DEFAULT 'cn',
  `sortorder` int(11) DEFAULT '0',
  `intro` char(1) NOT NULL DEFAULT 'N',
  `kind` char(1) NOT NULL DEFAULT 'T',
  `atom` int(11) DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`item`,`language`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES ('1', '97', 'cn', '10', 'N', 'T', '0', '', '<p><span>Cody draagt zorg voor uw privacy. Lees deze Privacyverklaring om meer te weten te komen over de manier waarop persoonsgegevens worden ingezameld en verwerkt op deze website. In dit geval handelt Cody Howest daarbij steeds in overeenstemming met de bepalingen van de Belgische privacywet (Wet van 8 december 1992 tot bescherming van de persoonlijke levenssfeer ten opzichte van de verwerking van persoonsgegevens). De persoonlijke gegevens beperken zich enkel tot uw e-mailadres.</span></p>\n<p><span><strong>Verantwoordelijke</strong></span></p>\n<p><span>De verantwoordelijke voor de verwerking is Cody Howest; Rijselstraat 5, 8000 Brugge.</span></p>\n<p><span><strong>Kennisname</strong></span></p>\n<p><span>U kan van deze persoonsgegevens kennis nemen door een aanvraag te richten aan Cody Howest</span><span>(brief, fax of e-mail) en ze, indien nodig, doen verbeteren of verwijderen. Indien u niet gecontacteerd wenst te worden in het kader van email marketing, zullen uw gegevens op uw verzoek kosteloos uit de betrokken lijsten worden</span></p>\n<p><span><strong>Cookies</strong></span></p>\n<p><span>Wij gebruiken cookies om uw toekomstig bezoek aan onze site vlotter te laten verlopen. Een cookie is een klein stukje tekst dat op uw harde schijf wordt geplaatst. Cookies worden veel gebruikt om een hoger functionaliteit, en dus betere dienst, aan de bezoekers te kunnen aanbieden. [U kan het gebruik van cookies uitschakelen, al leidt dit er wel toe dat effecten opsommen die ten gevolge van het uitschakelen van cookies worden veroorzaakt.]</span></p>\n<p><span><strong>Veiligheid</strong></span></p>\n<p><span>Cody Howest verbindt zich ertoe om al de gepaste technische en organisatorische maatregelen te treffen om uw persoonsgegevens te beschermen tegen vernietiging, verlies, onbedoelde wijziging, beschadiging of openbaarmaking.</span></p>\n<p><span><strong>Toestemming</strong></span></p>\n<p><span>Door u akkoord te verklaren met deze voorwaarden en condities geeft u ook uw toestemming voor de verwerking van uw persoonsgegevens voor de doeleinden zoals hierboven beschreven.</span></p>');
INSERT INTO `content` VALUES ('2', '98', 'cn', '10', 'N', 'T', '0', '', '<p><span>Door gebruik te maken van deze website verklaart u zich akkoord met onderstaande voorwaarden en condities.</span></p>\n<p><span><strong>1. Website</strong></span></p>\n<p>De eigenaar van deze website is&nbsp;<br /> Cody Howest,<br /> Rijselstraat 5<br /> 8000, Brugge,&nbsp;<br /> Belgi&euml;<br /> Tel: 32(0)50 xx,&nbsp;<br /> E-mail: info@howest.be&nbsp;<br />ON: xx</p>\n<p><span>Als u niet akkoord gaat met onderstaande voorwaarden wordt u verzocht de website te verlaten. Cody behoudt zich het recht voor deze voorwaarden periodisch aan te passen waarna de leden op de hoogte zullen worden gebracht van deze wijzigingen. Wanneer u na deze kennisgeving de website blijft gebruiken verklaart u zich akkoord met de doorgevoerde wijzigingen. Cody Howest&nbsp; kan eventueel andere diensten aanbieden aan de gebruikers van deze site. In dat geval zullen de geldende voorwaarden apart worden medegedeeld.</span></p>\n<p><span><strong>2. Toegankelijkheid</strong></span></p>\n<p><span>Cody Howest&nbsp; probeert zo goed als mogelijk de website 24 uur per dag toegankelijk te houden, nochtans kan het gebeuren dat de website ontoegankelijk is voor een korte periode omwille van onderhoudswerken, aanpassingen of technische redenen.</span></p>\n<p><span><strong>3. Verantwoordelijkheid</strong></span></p>\n<p><span>Cody Howest weerlegt elke verantwoordelijkheid met betrekking tot deze website en de aangeboden informatie. Cody Howest&nbsp; verzekert niet dat de informatie op deze website correct, compleet of actueel is. Alle informatie, producten en diensten op deze website kunnen fouten bevatten. De gebruiker wordt verzocht hiermee rekening te houden.</span></p>\n<div><span><br /></span></div>');
INSERT INTO `content` VALUES ('7', '1', 'cn', '10', 'Y', 'S', '0', 'phone', '0491-797204');
INSERT INTO `content` VALUES ('9', '1', 'cn', '20', 'Y', 'S', '0', 'address', 'Rijselstraat 1');
INSERT INTO `content` VALUES ('12', '1', 'cn', '30', 'N', 'S', '0', 'footer.first', '<a href=\"mailto:info@mysite.com\">info@mysite.com</a>');
INSERT INTO `content` VALUES ('13', '1', 'cn', '40', 'N', 'S', '0', 'footer.second', '<a href=\"/nl/voorwaarden\">Algemene voorwaarden</a>');
INSERT INTO `content` VALUES ('14', '1', 'cn', '50', 'N', 'S', '0', 'footer.third', '');
INSERT INTO `content` VALUES ('15', '1', 'cn', '60', 'N', 'S', '0', 'Google Analytics code', 'UA-xxxxxxx-4');
INSERT INTO `content` VALUES ('19', '105', 'cn', '10', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 105</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('20', '105', 'cn', '30', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 105</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('23', '106', 'cn', '30', 'N', 'M', '32', 'Form', '');
INSERT INTO `content` VALUES ('24', '106', 'cn', '20', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 106</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('29', '147', 'cn', '20', 'N', 'I', '0', 'Image', '');
INSERT INTO `content` VALUES ('30', '150', 'cn', '10', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 150</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('32', '151', 'cn', '10', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 151</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('35', '148', 'cn', '10', 'Y', 'T', '0', 'Text', '<h3>Lorem Ipsum - 148</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('36', '148', 'cn', '30', 'N', 'S', '0', 'String', '<embed type=\"application/x-shockwave-flash\" src=\"https://static.googleusercontent.com/external_content/picasaweb.googleusercontent.com/slideshow.swf\" width=\"550\" height=\"370\" flashvars=\"host=picasaweb.google.com&hl=en_US&feat=flashalbum&RGB=0x000000&feed=https%3A%2F%2Fpicasaweb.google.com%2Fdata%2Ffeed%2Fapi%2Fuser%2F102890025833311035792%2Falbumid%2F5504535003666704193%3Falt%3Drss%26kind%3Dphoto%26hl%3Den_US\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\"></embed>');
INSERT INTO `content` VALUES ('37', '148', 'cn', '20', 'Y', 'I', '41', 'Image', '');
INSERT INTO `content` VALUES ('38', '105', 'cn', '20', 'N', 'F', '45', 'File', '');
INSERT INTO `content` VALUES ('40', '149', 'cn', '20', 'Y', 'I', '42', 'Image', '');
INSERT INTO `content` VALUES ('41', '149', 'cn', '10', 'Y', 'T', '0', 'Text', '<h3>Lorem Ipsum - 149</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('42', '150', 'cn', '20', 'N', 'F', '37', 'File', '');
INSERT INTO `content` VALUES ('43', '150', 'cn', '30', 'N', 'I', '43', 'Image', '');
INSERT INTO `content` VALUES ('45', '147', 'cn', '10', 'N', 'B', '0', 'Block', 'www.mysite.com/[page]');
INSERT INTO `content` VALUES ('46', '152', 'cn', '10', 'N', 'B', '0', 'Block', 'www.mysite.com/[page]');
INSERT INTO `content` VALUES ('48', '153', 'cn', '10', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 153</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('49', '106', 'cn', '10', 'Y', 'T', '0', 'Text', '<h3>Lorem Ipsum - 106</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('51', '155', 'cn', '10', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 155</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('52', '149', 'cn', '30', 'N', 'S', '0', 'String', '<embed type=\"application/x-shockwave-flash\" src=\"https://static.googleusercontent.com/external_content/picasaweb.googleusercontent.com/slideshow.swf\" width=\"550\" height=\"370\" flashvars=\"host=picasaweb.google.com&hl=en_US&feat=flashalbum&RGB=0x000000&feed=https%3A%2F%2Fpicasaweb.google.com%2Fdata%2Ffeed%2Fapi%2Fuser%2F102890025833311035792%2Falbumid%2F5929480423932141185%3Falt%3Drss%26kind%3Dphoto%26hl%3Den_US\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\"></embed>');
INSERT INTO `content` VALUES ('53', '148', 'cn', '40', 'N', 'B', '0', 'Block', 'www.mysite.com/[page]');
INSERT INTO `content` VALUES ('54', '149', 'cn', '40', 'N', 'B', '0', 'Block', 'www.mysite.com/[page]');
INSERT INTO `content` VALUES ('55', '103', 'cn', '20', 'N', 'B', '0', 'Block', 'www.mysite.com/[page]');
INSERT INTO `content` VALUES ('56', '155', 'cn', '20', 'N', 'B', '0', 'Block', 'https://www.facebook.com/mysite');
INSERT INTO `content` VALUES ('57', '103', 'cn', '10', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 103</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('58', '156', 'cn', '10', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 156</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('59', '157', 'cn', '10', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 157</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('60', '97', 'en', '10', 'N', 'T', '0', '', '<p><span>Cody draagt zorg voor uw privacy. Lees deze Privacyverklaring om meer te weten te komen over de manier waarop persoonsgegevens worden ingezameld en verwerkt op deze website. In dit geval handelt Cody Howest daarbij steeds in overeenstemming met de bepalingen van de Belgische privacywet (Wet van 8 december 1992 tot bescherming van de persoonlijke levenssfeer ten opzichte van de verwerking van persoonsgegevens). De persoonlijke gegevens beperken zich enkel tot uw e-mailadres.</span></p>\n<p><span><strong>Verantwoordelijke</strong></span></p>\n<p><span>De verantwoordelijke voor de verwerking is Cody Howest; Rijselstraat 5, 8000 Brugge.</span></p>\n<p><span><strong>Kennisname</strong></span></p>\n<p><span>U kan van deze persoonsgegevens kennis nemen door een aanvraag te richten aan Cody Howest</span><span>(brief, fax of e-mail) en ze, indien nodig, doen verbeteren of verwijderen. Indien u niet gecontacteerd wenst te worden in het kader van email marketing, zullen uw gegevens op uw verzoek kosteloos uit de betrokken lijsten worden</span></p>\n<p><span><strong>Cookies</strong></span></p>\n<p><span>Wij gebruiken cookies om uw toekomstig bezoek aan onze site vlotter te laten verlopen. Een cookie is een klein stukje tekst dat op uw harde schijf wordt geplaatst. Cookies worden veel gebruikt om een hoger functionaliteit, en dus betere dienst, aan de bezoekers te kunnen aanbieden. [U kan het gebruik van cookies uitschakelen, al leidt dit er wel toe dat effecten opsommen die ten gevolge van het uitschakelen van cookies worden veroorzaakt.]</span></p>\n<p><span><strong>Veiligheid</strong></span></p>\n<p><span>Cody Howest verbindt zich ertoe om al de gepaste technische en organisatorische maatregelen te treffen om uw persoonsgegevens te beschermen tegen vernietiging, verlies, onbedoelde wijziging, beschadiging of openbaarmaking.</span></p>\n<p><span><strong>Toestemming</strong></span></p>\n<p><span>Door u akkoord te verklaren met deze voorwaarden en condities geeft u ook uw toestemming voor de verwerking van uw persoonsgegevens voor de doeleinden zoals hierboven beschreven.</span></p>');
INSERT INTO `content` VALUES ('61', '98', 'en', '10', 'N', 'T', '0', '', '<p><span>Door gebruik te maken van deze website verklaart u zich akkoord met onderstaande voorwaarden en condities.</span></p>\n<p><span><strong>1. Website</strong></span></p>\n<p>De eigenaar van deze website is&nbsp;<br /> Cody Howest,<br /> Rijselstraat 5<br /> 8000, Brugge,&nbsp;<br /> Belgi&euml;<br /> Tel: 32(0)50 xx,&nbsp;<br /> E-mail: info@howest.be&nbsp;<br />ON: xx</p>\n<p><span>Als u niet akkoord gaat met onderstaande voorwaarden wordt u verzocht de website te verlaten. Cody behoudt zich het recht voor deze voorwaarden periodisch aan te passen waarna de leden op de hoogte zullen worden gebracht van deze wijzigingen. Wanneer u na deze kennisgeving de website blijft gebruiken verklaart u zich akkoord met de doorgevoerde wijzigingen. Cody Howest&nbsp; kan eventueel andere diensten aanbieden aan de gebruikers van deze site. In dat geval zullen de geldende voorwaarden apart worden medegedeeld.</span></p>\n<p><span><strong>2. Toegankelijkheid</strong></span></p>\n<p><span>Cody Howest&nbsp; probeert zo goed als mogelijk de website 24 uur per dag toegankelijk te houden, nochtans kan het gebeuren dat de website ontoegankelijk is voor een korte periode omwille van onderhoudswerken, aanpassingen of technische redenen.</span></p>\n<p><span><strong>3. Verantwoordelijkheid</strong></span></p>\n<p><span>Cody Howest weerlegt elke verantwoordelijkheid met betrekking tot deze website en de aangeboden informatie. Cody Howest&nbsp; verzekert niet dat de informatie op deze website correct, compleet of actueel is. Alle informatie, producten en diensten op deze website kunnen fouten bevatten. De gebruiker wordt verzocht hiermee rekening te houden.</span></p>\n<div><span><br /></span></div>');
INSERT INTO `content` VALUES ('66', '1', 'en', '10', 'Y', 'S', '0', 'phone', '0491-797204');
INSERT INTO `content` VALUES ('68', '1', 'en', '20', 'Y', 'S', '0', 'address', 'Rijselstraat 1');
INSERT INTO `content` VALUES ('71', '1', 'en', '30', 'N', 'S', '0', 'footer.first', '<a href=\"mailto:info@mysite.com\">info@mysite.com</a>');
INSERT INTO `content` VALUES ('72', '1', 'en', '40', 'N', 'S', '0', 'footer.second', '<a href=\"/nl/voorwaarden\">Algemene voorwaarden</a>');
INSERT INTO `content` VALUES ('73', '1', 'en', '50', 'N', 'S', '0', 'footer.third', '');
INSERT INTO `content` VALUES ('74', '1', 'en', '60', 'N', 'S', '0', 'Google Analytics code', 'UA-xxxxxxx-4');
INSERT INTO `content` VALUES ('78', '105', 'en', '10', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 105</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('79', '105', 'en', '30', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 105</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('82', '106', 'en', '30', 'N', 'M', '32', 'Form', '');
INSERT INTO `content` VALUES ('83', '106', 'en', '20', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 106</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('88', '147', 'en', '20', 'N', 'I', '0', 'Image', '');
INSERT INTO `content` VALUES ('89', '150', 'en', '10', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 150</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('91', '151', 'en', '10', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 151</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('94', '148', 'en', '10', 'Y', 'T', '0', 'Text', '<h3>Lorem Ipsum - 148</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('95', '148', 'en', '30', 'N', 'S', '0', 'String', '<embed type=\"application/x-shockwave-flash\" src=\"https://static.googleusercontent.com/external_content/picasaweb.googleusercontent.com/slideshow.swf\" width=\"550\" height=\"370\" flashvars=\"host=picasaweb.google.com&hl=en_US&feat=flashalbum&RGB=0x000000&feed=https%3A%2F%2Fpicasaweb.google.com%2Fdata%2Ffeed%2Fapi%2Fuser%2F102890025833311035792%2Falbumid%2F5504535003666704193%3Falt%3Drss%26kind%3Dphoto%26hl%3Den_US\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\"></embed>');
INSERT INTO `content` VALUES ('96', '148', 'en', '20', 'Y', 'I', '41', 'Image', '');
INSERT INTO `content` VALUES ('97', '105', 'en', '20', 'N', 'F', '45', 'File', '');
INSERT INTO `content` VALUES ('99', '149', 'en', '20', 'Y', 'I', '42', 'Image', '');
INSERT INTO `content` VALUES ('100', '149', 'en', '10', 'Y', 'T', '0', 'Text', '<h3>Lorem Ipsum - 149</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('101', '150', 'en', '20', 'N', 'F', '37', 'File', '');
INSERT INTO `content` VALUES ('102', '150', 'en', '30', 'N', 'I', '43', 'Image', '');
INSERT INTO `content` VALUES ('104', '147', 'en', '10', 'N', 'B', '0', 'Block', 'www.mysite.com/[page]');
INSERT INTO `content` VALUES ('105', '152', 'en', '10', 'N', 'B', '0', 'Block', 'www.mysite.com/[page]');
INSERT INTO `content` VALUES ('107', '153', 'en', '10', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 153</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('108', '106', 'en', '10', 'Y', 'T', '0', 'Text', '<h3>Lorem Ipsum - 106</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('110', '155', 'en', '10', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 155</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('111', '149', 'en', '30', 'N', 'S', '0', 'String', '<embed type=\"application/x-shockwave-flash\" src=\"https://static.googleusercontent.com/external_content/picasaweb.googleusercontent.com/slideshow.swf\" width=\"550\" height=\"370\" flashvars=\"host=picasaweb.google.com&hl=en_US&feat=flashalbum&RGB=0x000000&feed=https%3A%2F%2Fpicasaweb.google.com%2Fdata%2Ffeed%2Fapi%2Fuser%2F102890025833311035792%2Falbumid%2F5929480423932141185%3Falt%3Drss%26kind%3Dphoto%26hl%3Den_US\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\"></embed>');
INSERT INTO `content` VALUES ('112', '148', 'en', '40', 'N', 'B', '0', 'Block', 'www.mysite.com/[page]');
INSERT INTO `content` VALUES ('113', '149', 'en', '40', 'N', 'B', '0', 'Block', 'www.mysite.com/[page]');
INSERT INTO `content` VALUES ('114', '103', 'en', '20', 'N', 'B', '0', 'Block', 'www.mysite.com/[page]');
INSERT INTO `content` VALUES ('115', '155', 'en', '20', 'N', 'B', '0', 'Block', 'https://www.facebook.com/mysite');
INSERT INTO `content` VALUES ('116', '103', 'en', '10', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 103</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('117', '156', 'en', '10', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 156</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');
INSERT INTO `content` VALUES ('118', '157', 'en', '10', 'N', 'T', '0', 'Text', '<h3>Lorem Ipsum - 157</h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.');

-- ----------------------------
-- Table structure for data
-- ----------------------------
DROP TABLE IF EXISTS `data`;
CREATE TABLE `data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atom` int(11) NOT NULL DEFAULT '0',
  `data` text,
  `status` char(1) NOT NULL DEFAULT 'S',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data
-- ----------------------------
INSERT INTO `data` VALUES ('1', '32', '{\"Titel\":\"\",\"Naam\":\"ikke\",\"e-mail adres\":\"steve.jobs@apple.com\",\"vraag\":\"Ik heb geen vragen!\"}', 'S', '2013-09-10 19:09:39', null);

-- ----------------------------
-- Table structure for domains
-- ----------------------------
DROP TABLE IF EXISTS `domains`;
CREATE TABLE `domains` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(32) DEFAULT '?'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of domains
-- ----------------------------
INSERT INTO `domains` VALUES ('admin', 'Admin');
INSERT INTO `domains` VALUES ('cms', 'CMS Users');
INSERT INTO `domains` VALUES ('user', 'Users');

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `parent` int(11) NOT NULL DEFAULT '0',
  `user` int(11) DEFAULT '0',
  `template` int(11) NOT NULL DEFAULT '1',
  `orderby` char(1) DEFAULT 'A',
  `sortorder` int(11) DEFAULT '0',
  `dated` date DEFAULT '2010-01-01',
  `validfrom` datetime NOT NULL DEFAULT '2010-01-01 01:01:01',
  `validto` datetime NOT NULL DEFAULT '2010-01-01 01:01:01',
  `showcontent` char(1) DEFAULT 'Y',
  `needslogin` char(1) DEFAULT 'N',
  `defaultrequest` varchar(32) DEFAULT '',
  `alloweddomains` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `parent_idx` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('1', '网站', '-1', '1', '100', 'M', '100', '2010-01-01', '2010-01-01 01:01:01', '2100-01-01 01:01:01', 'S', null, 'list', '');
INSERT INTO `items` VALUES ('2', '登录', '3', '1', '2', 'A', '99', '2010-01-01', '2010-01-01 01:01:01', '2100-01-01 01:01:01', 'Y', 'N', '', '');
INSERT INTO `items` VALUES ('3', '页面', '-1', '1', '100', 'M', '0', '2010-01-01', '2010-01-01 01:01:01', '2100-01-01 01:01:01', 'Y', 'Y', '', '');
INSERT INTO `items` VALUES ('4', '底部', '-1', '1', '100', 'M', '0', '2010-01-01', '2010-01-01 01:01:01', '2100-01-01 01:01:01', 'Y', 'Y', '', '');
INSERT INTO `items` VALUES ('9', '主面板', '-1', '1', '9', 'M', '0', '2010-01-01', '2010-01-01 01:01:01', '2100-01-01 01:01:01', 'Y', 'Y', '', '');
INSERT INTO `items` VALUES ('10', 'CMS', '9', '1', '2', 'M', '10', '2010-01-01', '2010-01-01 01:01:01', '2100-01-01 01:01:01', 'S', 'Y', '', '');
INSERT INTO `items` VALUES ('11', '结构', '10', '1', '11', 'A', '10', '2010-01-01', '2010-01-01 01:01:01', '2100-01-01 01:01:01', 'Y', 'Y', '', '');
INSERT INTO `items` VALUES ('12', '图片', '10', '1', '12', 'A', '20', '2010-01-01', '2010-01-01 01:01:01', '2100-01-01 01:01:01', 'Y', 'Y', '', '');
INSERT INTO `items` VALUES ('13', '文件', '10', '1', '13', 'A', '30', '2010-01-01', '2010-01-01 01:01:01', '2100-01-01 01:01:01', 'Y', 'Y', '', '');
INSERT INTO `items` VALUES ('14', '表单', '10', '1', '14', 'A', '40', '2010-01-01', '2010-01-01 01:01:01', '2100-01-01 01:01:01', 'Y', 'Y', '', '');
INSERT INTO `items` VALUES ('15', '用户', '10', '1', '15', 'A', '50', '2010-01-01', '2010-01-01 01:01:01', '2100-01-01 01:01:01', 'Y', 'Y', 'list', '');
INSERT INTO `items` VALUES ('16', '模板', '10', '1', '16', 'A', '60', '2010-01-01', '2010-01-01 01:01:01', '2100-01-01 01:01:01', 'Y', 'Y', 'list', '');
INSERT INTO `items` VALUES ('20', '管理', '9', '1', '2', 'M', '10', '2010-01-01', '2010-01-01 01:01:01', '2100-01-01 01:01:01', 'S', 'Y', '', '');
INSERT INTO `items` VALUES ('21', '表单', '20', '1', '18', 'A', '10', '2010-01-01', '2010-01-01 01:01:01', '2100-01-01 01:01:01', 'Y', 'Y', '', '');
INSERT INTO `items` VALUES ('22', '评论', '20', '1', '19', 'A', '10', '2010-01-01', '2010-01-01 01:01:01', '2100-01-01 01:01:01', 'Y', 'Y', '', '');
INSERT INTO `items` VALUES ('97', '隐私声明', '4', '1', '100', 'A', '0', '2010-01-01', '2010-01-01 01:01:01', '2100-01-01 01:01:01', 'Y', 'N', '', '');
INSERT INTO `items` VALUES ('98', '免责声明', '4', '1', '100', 'A', '0', '2010-01-01', '2010-01-01 01:01:01', '2100-01-01 01:01:01', 'Y', 'N', '', '');
INSERT INTO `items` VALUES ('99', '全局', '3', '1', '100', 'A', '0', '2010-01-01', '2010-01-01 01:01:01', '2100-01-01 01:01:01', 'Y', 'N', '', '');
INSERT INTO `items` VALUES ('102', 'Map1', '1', '1', '100', 'M', '40', '2013-07-11', '2013-07-11 00:00:00', '2101-01-31 00:00:00', 'S', null, 'list', '');
INSERT INTO `items` VALUES ('103', '页面1', '1', '1', '100', 'A', '20', '2013-07-11', '2013-07-11 00:00:00', '2101-01-31 00:00:00', 'Y', null, 'list', '');
INSERT INTO `items` VALUES ('105', 'page2 in map', '102', '1', '100', 'A', '20', '2013-07-11', '2013-07-11 01:01:01', '2101-01-31 01:01:01', 'Y', null, 'list', '');
INSERT INTO `items` VALUES ('106', 'Contact Us', '1', '1', '100', 'A', '70', '2013-09-07', '2013-09-07 01:01:01', '2101-01-31 01:01:01', 'Y', null, 'list', '');
INSERT INTO `items` VALUES ('147', 'Intros', '1', '1', '103', 'M', '60', '2013-09-08', '2013-09-08 01:01:01', '2101-01-31 01:01:01', 'Y', null, 'list', '');
INSERT INTO `items` VALUES ('148', 'subpage 1', '147', '1', '100', 'M', '10', '2013-09-08', '2013-09-08 01:01:01', '2101-01-31 01:01:01', 'Y', null, 'list', '');
INSERT INTO `items` VALUES ('149', 'subpage 2', '147', '1', '100', 'M', '20', '2013-09-08', '2013-09-08 01:01:01', '2101-01-31 01:01:01', 'Y', null, 'list', '');
INSERT INTO `items` VALUES ('150', 'page1 in map', '102', '1', '100', 'A', '10', '2013-09-08', '2013-09-08 00:00:00', '2101-01-31 00:00:00', 'Y', null, 'list', '');
INSERT INTO `items` VALUES ('151', 'Page2', '1', '1', '100', 'M', '30', '2013-09-08', '2013-09-08 01:01:01', '2101-01-31 01:01:01', 'Y', null, 'list', '');
INSERT INTO `items` VALUES ('152', 'News', '1', '1', '100', 'D', '10', '2013-09-08', '2013-09-08 01:01:01', '2101-01-31 01:01:01', 'S', null, 'list', '');
INSERT INTO `items` VALUES ('153', '第三个页面', '102', '1', '100', 'M', '30', '2013-09-09', '2013-09-09 00:00:00', '2101-01-31 00:00:00', 'Y', null, 'list', '');
INSERT INTO `items` VALUES ('154', '11 sept 13', '152', '1', '100', 'M', '5', '2013-09-11', '2013-09-11 01:01:01', '2101-01-31 01:01:01', 'Y', null, 'list', '');
INSERT INTO `items` VALUES ('155', '28 sept 13', '152', '1', '100', 'M', '5', '2013-09-28', '2013-09-30 01:01:01', '2101-01-31 01:01:01', 'Y', null, 'list', '');
INSERT INTO `items` VALUES ('156', '02 nov 13', '152', '1', '100', 'D', '5', '2013-11-02', '2013-11-02 01:01:01', '2101-01-31 01:01:01', 'Y', null, 'list', '');
INSERT INTO `items` VALUES ('157', 'New item', '152', '1', '100', 'D', '5', '2013-12-06', '2013-12-06 01:01:01', '2101-01-31 01:01:01', 'Y', null, 'list', '');

-- ----------------------------
-- Table structure for languages
-- ----------------------------
DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `id` varchar(4) NOT NULL DEFAULT '',
  `name` varchar(32) DEFAULT '',
  `sortorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of languages
-- ----------------------------
INSERT INTO `languages` VALUES ('cn', '中文', '1');
INSERT INTO `languages` VALUES ('en', 'English', '2');

-- ----------------------------
-- Table structure for levels
-- ----------------------------
DROP TABLE IF EXISTS `levels`;
CREATE TABLE `levels` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of levels
-- ----------------------------
INSERT INTO `levels` VALUES ('2', 'user');
INSERT INTO `levels` VALUES ('50', 'admin');
INSERT INTO `levels` VALUES ('99', 'super');

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `item` int(11) NOT NULL DEFAULT '0',
  `language` varchar(2) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `active` char(1) DEFAULT 'Y',
  `keywords` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `created` datetime DEFAULT '2010-01-01 01:01:01',
  `updated` datetime DEFAULT '2010-01-01 01:01:01',
  PRIMARY KEY (`item`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES ('1', 'cn', '欢迎界面', 'welcome', 'Y', '', '', '2010-01-01 01:01:01', '2014-09-03 11:08:24');
INSERT INTO `pages` VALUES ('1', 'en', 'Empty Site', 'welcome', 'Y', '', '', '2010-01-01 01:01:01', '2014-09-03 11:08:14');
INSERT INTO `pages` VALUES ('2', 'cn', '登录', 'login', 'Y', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `pages` VALUES ('2', 'en', 'Login', 'login', 'Y', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `pages` VALUES ('3', 'cn', '页面', '', 'Y', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `pages` VALUES ('3', 'en', 'Pages', '', 'Y', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `pages` VALUES ('4', 'cn', '底部', '', 'Y', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `pages` VALUES ('4', 'en', 'Footer', '', 'Y', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `pages` VALUES ('9', 'cn', '主面板', 'dashboard', 'Y', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `pages` VALUES ('9', 'en', 'Dashboard', 'dashboard', 'Y', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `pages` VALUES ('10', 'cn', '网站CMS', 'cms', 'Y', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `pages` VALUES ('10', 'en', 'Website CMS', 'cms', 'Y', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `pages` VALUES ('11', 'cn', '结构', 'pages', 'Y', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `pages` VALUES ('11', 'en', 'Structure', 'pages', 'Y', '', '', '2010-01-01 01:01:01', '2014-09-03 10:21:49');
INSERT INTO `pages` VALUES ('12', 'cn', '图片', 'images', 'Y', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `pages` VALUES ('12', 'en', 'Images', 'images', 'Y', '', '', '2010-01-01 01:01:01', '2014-09-03 10:21:53');
INSERT INTO `pages` VALUES ('13', 'cn', '文件', 'files', 'Y', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `pages` VALUES ('13', 'en', 'Files', 'files', 'Y', '', '', '2010-01-01 01:01:01', '2014-09-03 10:21:57');
INSERT INTO `pages` VALUES ('14', 'cn', '表单', 'forms', 'Y', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `pages` VALUES ('14', 'en', 'Forms', 'forms', 'Y', '', '', '2010-01-01 01:01:01', '2014-09-03 10:22:01');
INSERT INTO `pages` VALUES ('15', 'cn', '用户', 'users', 'Y', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `pages` VALUES ('15', 'en', 'Users', 'users', 'Y', '', '', '2010-01-01 01:01:01', '2014-09-03 10:22:05');
INSERT INTO `pages` VALUES ('16', 'cn', '模板', 'templates', 'Y', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `pages` VALUES ('16', 'en', 'Templates', 'templates', 'Y', '', '', '2010-01-01 01:01:01', '2014-09-03 10:22:10');
INSERT INTO `pages` VALUES ('20', 'cn', '管理台', 'admin', 'Y', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `pages` VALUES ('20', 'en', 'Management', 'admin', 'Y', '', '', '2010-01-01 01:01:01', '2014-09-03 10:22:35');
INSERT INTO `pages` VALUES ('21', 'cn', '表单', 'data', 'Y', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `pages` VALUES ('21', 'en', 'Forms', 'data', 'Y', '', '', '2010-01-01 01:01:01', '2014-09-03 10:22:39');
INSERT INTO `pages` VALUES ('22', 'cn', '评论', 'comments', 'Y', '', '', '2010-01-01 01:01:01', '2010-01-01 01:01:01');
INSERT INTO `pages` VALUES ('22', 'en', 'Comments', 'comments', 'Y', '', '', '2010-01-01 01:01:01', '2014-09-03 10:22:45');
INSERT INTO `pages` VALUES ('97', 'cn', '隐私声明', 'privacy', 'Y', '', '', '2010-01-01 01:01:01', '2013-03-19 09:30:30');
INSERT INTO `pages` VALUES ('97', 'en', 'Privacy Declaration', 'privacy', 'Y', '', '', '2010-01-01 01:01:01', '2013-03-19 09:30:30');
INSERT INTO `pages` VALUES ('98', 'cn', '免责声明', 'disclaimer', 'Y', '', '', '2010-01-01 01:01:01', '2012-08-20 17:09:50');
INSERT INTO `pages` VALUES ('98', 'en', 'Disclaimer', 'disclaimer', 'Y', '', '', '2010-01-01 01:01:01', '2012-08-20 17:09:50');
INSERT INTO `pages` VALUES ('99', 'cn', '全局', 'global', 'Y', '', '', '2010-01-01 01:01:01', '2012-08-15 22:02:59');
INSERT INTO `pages` VALUES ('99', 'en', 'Global', 'global', 'Y', '', '', '2010-01-01 01:01:01', '2012-08-15 22:02:59');
INSERT INTO `pages` VALUES ('102', 'cn', '父页面1', 'officiele_documenten', 'Y', '', '', '2013-07-11 16:00:40', '2016-03-21 17:39:40');
INSERT INTO `pages` VALUES ('102', 'en', 'Map1', 'officiele_documenten', 'Y', '', '', '2013-07-11 16:00:40', '2014-09-03 10:23:12');
INSERT INTO `pages` VALUES ('103', 'cn', '页面1', 'thepage', 'Y', '', '', '2013-07-11 16:00:47', '2016-03-28 18:05:25');
INSERT INTO `pages` VALUES ('103', 'en', 'Page1', 'page1', 'Y', '', '', '2013-07-11 16:00:47', '2014-09-03 10:23:01');
INSERT INTO `pages` VALUES ('105', 'cn', '第二个页面', 'Statuten', 'Y', '', '', '2013-07-11 16:40:43', '2013-09-09 16:03:57');
INSERT INTO `pages` VALUES ('105', 'en', 'page2 in map', 'stats', 'Y', '', '', '2013-07-11 16:40:43', '2014-09-03 10:23:54');
INSERT INTO `pages` VALUES ('106', 'cn', 'Contact Us', 'contact', 'Y', '', '', '2013-09-07 21:19:10', '2013-09-10 19:10:21');
INSERT INTO `pages` VALUES ('106', 'en', 'Contact Us', 'contact', 'Y', '', '', '2013-09-07 21:19:10', '2014-09-03 10:23:22');
INSERT INTO `pages` VALUES ('147', 'cn', 'Intros', '', 'Y', '', '', '2013-09-08 16:23:37', '2013-09-09 16:15:59');
INSERT INTO `pages` VALUES ('147', 'en', 'Intros', '', 'Y', '', '', '2013-09-08 16:23:37', '2014-09-03 10:23:18');
INSERT INTO `pages` VALUES ('148', 'cn', 'subpage 1', '', 'Y', '', '', '2013-09-08 16:25:28', '2013-10-21 17:01:46');
INSERT INTO `pages` VALUES ('148', 'en', 'subpage 1', '', 'Y', '', '', '2013-09-08 16:25:28', '2014-09-03 10:23:33');
INSERT INTO `pages` VALUES ('149', 'cn', 'subpage 2', '', 'Y', '', '', '2013-09-08 16:25:44', '2013-10-21 17:01:56');
INSERT INTO `pages` VALUES ('149', 'en', 'subpage 2', '', 'Y', '', '', '2013-09-08 16:25:44', '2014-09-03 10:23:37');
INSERT INTO `pages` VALUES ('150', 'cn', '第一个页面', '', 'Y', '', '', '2013-09-08 16:31:22', '2016-03-21 17:39:57');
INSERT INTO `pages` VALUES ('150', 'en', 'page1 in map', '', 'Y', '', '', '2013-09-08 16:31:22', '2014-09-03 10:24:07');
INSERT INTO `pages` VALUES ('151', 'cn', '页面2', 'pagina2', 'Y', '', '', '2013-09-08 16:40:07', '2013-12-08 17:16:01');
INSERT INTO `pages` VALUES ('151', 'en', 'Page2', 'page2', 'Y', '', '', '2013-09-08 16:40:07', '2014-09-03 10:23:07');
INSERT INTO `pages` VALUES ('152', 'cn', '新页面', 'nieuws', 'Y', '', '', '2013-09-08 16:41:58', '2013-09-30 19:52:12');
INSERT INTO `pages` VALUES ('152', 'en', 'News', 'news', 'Y', '', '', '2013-09-08 16:41:58', '2014-09-03 10:22:50');
INSERT INTO `pages` VALUES ('153', 'cn', '第三个页面', 'voorwaarden', 'Y', '', '', '2013-09-09 15:14:51', '2016-03-21 17:40:30');
INSERT INTO `pages` VALUES ('153', 'en', 'page3 in map', 'conditions', 'Y', '', '', '2013-09-09 15:14:51', '2014-09-03 10:24:01');
INSERT INTO `pages` VALUES ('154', 'cn', '11 sept 13', '11sep2013', 'Y', '', '', '2013-09-30 19:41:31', '2013-10-01 22:43:01');
INSERT INTO `pages` VALUES ('154', 'en', '11 sept 13', '11sep2013', 'Y', '', '', '2013-09-30 19:41:31', '2013-10-01 22:43:01');
INSERT INTO `pages` VALUES ('155', 'cn', '28 sept 13', '28sep2013', 'Y', '', '', '2013-09-30 19:43:20', '2013-10-20 23:30:55');
INSERT INTO `pages` VALUES ('155', 'en', '28 sept 13', '28sep2013', 'Y', '', '', '2013-09-30 19:43:20', '2013-10-20 23:30:55');
INSERT INTO `pages` VALUES ('156', 'cn', '02 nov 13', '02nov2013', 'Y', '', '', '2013-11-02 17:59:36', '2013-11-02 18:34:12');
INSERT INTO `pages` VALUES ('156', 'en', '02 nov 13', '02nov2013', 'Y', '', '', '2013-11-02 17:59:36', '2013-11-02 18:34:12');
INSERT INTO `pages` VALUES ('157', 'cn', '11 dec 13', '', 'Y', '', '', '2013-12-06 22:04:00', '2013-12-06 22:11:13');
INSERT INTO `pages` VALUES ('157', 'en', '11 dec 13', '', 'Y', '', '', '2013-12-06 22:04:00', '2013-12-06 22:11:13');

-- ----------------------------
-- Table structure for templates
-- ----------------------------
DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT '',
  `description` varchar(127) DEFAULT '',
  `controller` varchar(64) DEFAULT '',
  `fn` varchar(128) DEFAULT '',
  `allowedtemplates` varchar(255) DEFAULT '',
  `maxnumber` int(11) DEFAULT '99999',
  `system` char(1) DEFAULT 'N',
  `defaultchild` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of templates
-- ----------------------------
INSERT INTO `templates` VALUES ('2', 'Login', '', 'LoginController', '-/login.ejs', '', '0', 'Y', '0');
INSERT INTO `templates` VALUES ('9', 'Dashboard', '', 'DashboardController', '-/cms/dashboard.ejs', '', '0', 'Y', '0');
INSERT INTO `templates` VALUES ('11', 'CMS-Page', '', 'PageController', '-/cms/pages.ejs', '', '0', 'Y', '0');
INSERT INTO `templates` VALUES ('12', 'CMS-Images', '', 'ImageController', '-/cms/images.ejs', '', '0', 'Y', '0');
INSERT INTO `templates` VALUES ('13', 'CMS-Files', '', 'FileController', '-/cms/files.ejs', '', '0', 'Y', '0');
INSERT INTO `templates` VALUES ('14', 'CMS-Forms', '', 'FormController', '-/cms/forms.ejs', '', '0', 'Y', '0');
INSERT INTO `templates` VALUES ('15', 'CMS-Users', '', 'UserController', '-/cms/users.ejs', '', '0', 'Y', '0');
INSERT INTO `templates` VALUES ('16', 'CMS-Templates', '', 'TemplateController', '-/cms/templates.ejs', '', '0', 'Y', '0');
INSERT INTO `templates` VALUES ('18', 'Admin-Forms', 'Incoming data from forms', 'FormDataController', '-/cms/forms-list.ejs', '', '0', 'Y', '0');
INSERT INTO `templates` VALUES ('19', 'Admin-Comments', 'View approve, edit or trash comments', 'Controller', '-/cms/comments.ejs', '', '0', 'Y', '0');
INSERT INTO `templates` VALUES ('100', 'Content', '', 'Controller', 'index.ejs', '', '999', 'N', '100');
INSERT INTO `templates` VALUES ('103', 'With intros', 'Displays also all intro content of the pages below', 'Controller', 'intros.ejs', '', '0', 'N', '0');
INSERT INTO `templates` VALUES ('106', 'CMS-Styles', '', 'StylesController', '-/cms/styles.ejs', '', '0', 'Y', '0');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL DEFAULT '-',
  `name` varchar(128) NOT NULL DEFAULT '-',
  `password` char(64) DEFAULT NULL,
  `domain` varchar(32) NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT '0',
  `badlogins` int(11) NOT NULL DEFAULT '0',
  `maxbadlogins` int(11) NOT NULL DEFAULT '999',
  `active` char(1) NOT NULL DEFAULT 'Y',
  `email` varchar(128) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `nomail` char(1) NOT NULL DEFAULT 'N',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_idx` (`username`,`active`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'super', 'rWorks Super', '*BCF5280DEC442635BC70649677FBC2ADEBBD35F0', 'rWorks', '99', '0', '99', 'Y', 'info@mysite.com', '', 'N', '0');
INSERT INTO `users` VALUES ('2', 'admin', 'rWorks Admin', '*BCF5280DEC442635BC70649677FBC2ADEBBD35F0', 'rWorks', '50', '0', '99', 'Y', 'info@mysite.com', '', 'N', '0');
INSERT INTO `users` VALUES ('3', 'test', 'rWorks Test', '*BCF5280DEC442635BC70649677FBC2ADEBBD35F0', 'rWorks', '2', '0', '99', 'Y', 'info@mysite.com', '', 'N', '0');
INSERT INTO `users` VALUES ('11', 'user', 'Mr. Owner User', '*BCF5280DEC442635BC70649677FBC2ADEBBD35F0', 'users', '50', '0', '99', 'Y', 'info@mysite.com', '', 'N', '10');
