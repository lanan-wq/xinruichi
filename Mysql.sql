/*
SQLyog v10.2 
MySQL - 5.6.26-log : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test`;

/*Table structure for table `ausertable` */

DROP TABLE IF EXISTS `ausertable`;

CREATE TABLE `ausertable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `apwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ausertable` */

insert  into `ausertable`(`id`,`aname`,`apwd`) values (1,'admin','admin');

/*Table structure for table `busertable` */

DROP TABLE IF EXISTS `busertable`;

CREATE TABLE `busertable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bemail` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `bpwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `busertable` */

insert  into `busertable`(`id`,`bemail`,`bpwd`) values (1,'chenheng@126.com','78f8a7ae700c91db09facb05a675432b'),(2,'chenheng@163.com','78f8a7ae700c91db09facb05a675432b'),(3,'123','9f1d4fddd58c9d0b2315a57cf5a42b08'),(4,'liu','9f1d4fddd58c9d0b2315a57cf5a42b08'),(5,'laj','9f1d4fddd58c9d0b2315a57cf5a42b08'),(6,'test','9f1d4fddd58c9d0b2315a57cf5a42b08'),(7,'456','9f1d4fddd58c9d0b2315a57cf5a42b08');

/*Table structure for table `carttable` */

DROP TABLE IF EXISTS `carttable`;

CREATE TABLE `carttable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busertable_id` int(11) NOT NULL,
  `goodstable_id` int(11) NOT NULL,
  `shoppingnum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bid` (`busertable_id`),
  KEY `gno` (`goodstable_id`),
  CONSTRAINT `bid` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`),
  CONSTRAINT `gno` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `carttable` */

/*Table structure for table `focustable` */

DROP TABLE IF EXISTS `focustable`;

CREATE TABLE `focustable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodstable_id` int(11) NOT NULL,
  `busertable_id` int(11) NOT NULL,
  `focustime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gno1` (`goodstable_id`),
  KEY `bid1` (`busertable_id`),
  CONSTRAINT `bid1` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`),
  CONSTRAINT `gno1` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `focustable` */

insert  into `focustable`(`id`,`goodstable_id`,`busertable_id`,`focustime`) values (1,10,1,'2022-12-13 09:25:36'),(2,9,3,'2024-11-24 20:27:06'),(3,7,3,'2024-11-24 20:27:09'),(4,8,3,'2024-11-24 20:27:31'),(5,10,3,'2024-11-25 11:07:53'),(6,22,3,'2024-11-27 09:43:21'),(7,15,3,'2024-11-28 17:01:22'),(9,15,7,'2024-12-06 13:50:30');

/*Table structure for table `goodstable` */

DROP TABLE IF EXISTS `goodstable`;

CREATE TABLE `goodstable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `goprice` double DEFAULT NULL,
  `grprice` double DEFAULT NULL,
  `gstore` int(11) DEFAULT NULL,
  `gpicture` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `goodstype_id` int(11) DEFAULT NULL,
  `isshow` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeid` (`goodstype_id`),
  CONSTRAINT `typeid` FOREIGN KEY (`goodstype_id`) REFERENCES `goodstype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

/*Data for the table `goodstable` */

insert  into `goodstable`(`id`,`gname`,`goprice`,`grprice`,`gstore`,`gpicture`,`goodstype_id`,`isshow`) values (1,'专用机油滤清器',10,8,1000,'71.jpg',7,0),(2,'空气滤清器',20,10,3000,'72.jpg',7,0),(3,'雨刮片',40,30,300,'73.jpg',7,0),(4,'电池冷却液',20,16,6000,'74.jpg',7,0),(5,'汽车小摆件',20,16,20000,'75.png',7,0),(6,'轮胎',8888,7777,4000,'76.png',7,0),(7,'汽车配件',700,500,8000,'77.jpg',7,0),(8,'行车etc',80,60,5000,'78.jpg',7,0),(9,'行车工具包',500,400,2972,'79.jpg',7,0),(10,'行车燃油宝',800,700,39988,'710.jpg',7,0),(11,'丰田卡罗拉',150000,135000,10,'2.jpg',1,0),(15,'丰田汉兰达',280000,250000,1,'01.jpg',1,0),(19,'本田奥德赛',250000,220000,7,'11.png',2,0),(20,'本田飞度',80000,70000,15,'22.png',2,0),(21,'宝马3系',300000,270000,7,'31.png',3,0),(22,'宝马5系',450000,400000,5,'32.png',3,0),(23,'',1,1,1,'001.jpg',2,1),(24,'',2,2,2,'002.png',1,1),(26,'奔驰C级',320000,280000,8,'411.png',4,0),(27,'奔驰E级',480000,430000,6,'42.png',4,0),(34,'特斯拉Model X',300000,270000,15,'51.png',5,0),(35,'特斯拉Cybertruck',400000,360000,6,'52.png',5,0),(38,'比亚迪唐',250000,220000,10,'61.png',6,0),(39,'比亚迪汉',200000,180000,13,'62.png',6,0),(41,'test',3,1,14,'',8,0),(45,'11',11,11,11,'6093680442.jpg',1,0);

/*Table structure for table `goodstype` */

DROP TABLE IF EXISTS `goodstype`;

CREATE TABLE `goodstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `goodstype` */

insert  into `goodstype`(`id`,`typename`) values (1,'丰田'),(2,'本田'),(3,'宝马'),(4,'奔驰'),(5,'特斯拉'),(6,'比亚迪'),(7,'其他配件'),(8,'test2'),(9,'test4');

/*Table structure for table `orderbasetable` */

DROP TABLE IF EXISTS `orderbasetable`;

CREATE TABLE `orderbasetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busertable_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(4) NOT NULL,
  `orderdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bid2` (`busertable_id`),
  CONSTRAINT `bid2` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

/*Data for the table `orderbasetable` */

insert  into `orderbasetable`(`id`,`busertable_id`,`amount`,`status`,`orderdate`) values (1,1,4000,1,'2022-12-13 08:37:09'),(2,1,3200,0,'2022-12-13 09:26:40'),(3,1,5000,1,'2022-02-02 10:34:03'),(4,1,8000,1,'2022-03-11 14:38:33'),(5,1,1000,1,'2022-12-09 14:39:04'),(6,1,6000,1,'2020-07-31 14:39:21'),(7,1,5000,1,'2022-06-15 14:39:41'),(8,1,4000,1,'2022-07-15 14:40:00'),(9,1,6000,1,'2022-01-12 14:42:13'),(10,1,3000,1,'2022-04-22 14:42:35'),(11,1,18000,1,'2022-11-11 14:43:55'),(12,1,4000,0,'2022-12-15 18:58:06'),(13,3,700,0,'2024-11-24 20:27:47'),(14,3,257700,1,'2024-11-27 09:43:42'),(15,3,750000,0,'2024-11-29 10:19:04'),(16,3,750000,0,'2024-11-29 10:20:09'),(17,7,180000,1,'2024-12-06 13:49:50');

/*Table structure for table `orderdetail` */

DROP TABLE IF EXISTS `orderdetail`;

CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderbasetable_id` int(11) NOT NULL,
  `goodstable_id` int(11) NOT NULL,
  `shoppingnum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `odsn` (`orderbasetable_id`),
  KEY `gno3` (`goodstable_id`),
  CONSTRAINT `gno3` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`),
  CONSTRAINT `odsn` FOREIGN KEY (`orderbasetable_id`) REFERENCES `orderbasetable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

/*Data for the table `orderdetail` */

insert  into `orderdetail`(`id`,`orderbasetable_id`,`goodstable_id`,`shoppingnum`) values (1,1,9,10),(2,2,9,8),(3,3,1,20),(4,5,2,30),(5,4,3,10),(6,5,4,4),(7,6,5,4),(8,4,10,5),(9,7,8,3),(10,8,7,5),(11,12,9,10),(12,13,10,1),(13,14,10,11),(14,14,15,1),(15,15,15,3),(16,17,39,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
