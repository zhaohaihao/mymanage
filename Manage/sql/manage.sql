/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.28 : Database - manage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`manage` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `manage`;

/*Table structure for table `manage_login_log` */

DROP TABLE IF EXISTS `manage_login_log`;

CREATE TABLE `manage_login_log` (
  `mll_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户编号',
  `user_name` varchar(50) NOT NULL COMMENT '登陆名称',
  `login_ip` varchar(64) DEFAULT NULL COMMENT '登陆ip',
  `login_area` varchar(128) DEFAULT NULL COMMENT '登陆地点',
  `login_result` int(11) NOT NULL DEFAULT '0' COMMENT '登陆结果(0失败 1成功)',
  `log_time` datetime NOT NULL,
  PRIMARY KEY (`mll_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `manage_login_log` */

/*Table structure for table `manage_operate_log` */

DROP TABLE IF EXISTS `manage_operate_log`;

CREATE TABLE `manage_operate_log` (
  `mol_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(64) DEFAULT NULL,
  `log_time` datetime NOT NULL,
  `operate_name` varchar(255) DEFAULT NULL,
  `method_name` varchar(128) NOT NULL,
  PRIMARY KEY (`mol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

/*Data for the table `manage_operate_log` */

/*Table structure for table `manage_per` */

DROP TABLE IF EXISTS `manage_per`;

CREATE TABLE `manage_per` (
  `per_name` varchar(255) NOT NULL,
  `mp_id` int(11) NOT NULL,
  `father_mp_id` int(11) NOT NULL,
  `page_url` varchar(255) DEFAULT NULL,
  `sim_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `manage_per` */

insert  into `manage_per`(`per_name`,`mp_id`,`father_mp_id`,`page_url`,`sim_desc`) values ('管理后台',1,1,'',''),('系统管理',101,1,'',''),('用户管理',10101,101,'',''),('用户列表',1010101,10101,'manage/userListPage',''),('添加用户',101010101,1010101,'',''),('修改用户信息',101010102,1010101,'',''),('删除用户',101010103,1010101,'',''),('角色列表',1010102,10101,'manage/roleListPage',''),('添加角色',101010201,1010102,'',''),('修改角色',101010202,1010102,'',''),('权限列表',1010103,10101,'manage/perListPage',''),('添加权限',101010301,1010103,'',''),('修改权限',101010302,1010103,'',''),('日志记录',10103,101,'',''),('登录日志',1010301,10103,'manage/loginLogListPage',''),('操作记录',1010302,10103,'manage/operateLogListPage','');

/*Table structure for table `manage_role` */

DROP TABLE IF EXISTS `manage_role`;

CREATE TABLE `manage_role` (
  `mr_id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`mr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `manage_role` */

insert  into `manage_role`(`mr_id`,`role_name`) values (00000000001,'超级管理员'),(00000000002,'测试'),(00000000003,'dsa'),(00000000004,'管理员'),(00000000005,'新角色'),(00000000006,'外部用户'),(00000000007,'产品库人员'),(00000000008,'运营');

/*Table structure for table `manage_role_per` */

DROP TABLE IF EXISTS `manage_role_per`;

CREATE TABLE `manage_role_per` (
  `mrp_id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `mr_id` int(11) NOT NULL,
  `mp_id` int(11) NOT NULL,
  PRIMARY KEY (`mrp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1051173 DEFAULT CHARSET=utf8;

/*Data for the table `manage_role_per` */

insert  into `manage_role_per`(`mrp_id`,`mr_id`,`mp_id`) values (00000000001,1,1),(00000000002,1,101),(00000000003,1,10101),(00000000004,1,1010101),(00000000005,1,101010101),(00000000006,1,101010102),(00000000007,1,101010103),(00000000008,1,1010102),(00000000009,1,101010201),(00000000010,1,101010202),(00000000011,1,1010103),(00000000012,1,101010301),(00000000013,1,101010302),(00000000014,1,10103),(00000000015,1,1010301),(00000000016,1,1010302);

/*Table structure for table `manage_user` */

DROP TABLE IF EXISTS `manage_user`;

CREATE TABLE `manage_user` (
  `mu_id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `real_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `reg_time` datetime NOT NULL,
  `last_login_time` datetime NOT NULL,
  `mr_id` int(11) NOT NULL,
  `head_img` varchar(255) DEFAULT NULL,
  `kind_id` int(11) DEFAULT NULL COMMENT '游戏类别id',
  `channel_id` varchar(255) DEFAULT NULL COMMENT '渠道id',
  `platform_id` varchar(255) DEFAULT NULL COMMENT '平台id',
  `is_external_user` int(11) DEFAULT NULL COMMENT '外部用户1',
  PRIMARY KEY (`mu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `manage_user` */

insert  into `manage_user`(`mu_id`,`user_name`,`real_name`,`password`,`reg_time`,`last_login_time`,`mr_id`,`head_img`,`kind_id`,`channel_id`,`platform_id`,`is_external_user`) values (00000000034,'18621105531','胡林云','9966A318493AEAA94DB362BE9AFA18AF','2015-02-10 10:49:01','2015-10-13 19:43:47',1,'http://image.1jlc.com/upload/1435310421762_1.jpg',NULL,NULL,NULL,NULL),(00000000002,'liaoxiangan','廖先干','B0550553BD69EA434DB362BE9AFA18AF','2015-02-11 15:49:04','2015-02-11 15:49:07',1,'http://image.1jlc.com/upload/fishmanage/1435916566102_21.jpg',NULL,NULL,NULL,NULL),(00000000003,'1231','321','AF4120900EA653BC','2015-02-11 15:49:20','2015-02-11 15:49:23',1,'http://image.1jlc.com/upload/1435297658799_21.jpg',NULL,NULL,NULL,NULL),(00000000004,'1231','321','AF4120900EA653BC','2015-02-12 13:49:22','2015-02-12 13:49:22',1,'http://image.1jlc.com/upload/1435892580732_21.jpg',NULL,NULL,NULL,NULL),(00000000005,'1231','321','AF4120900EA653BC','2015-02-12 13:51:05','2015-02-12 13:51:05',1,'http://image.1jlc.com/upload/1435200043325_21.jpg',NULL,NULL,NULL,NULL),(00000000006,'1231','321','AF4120900EA653BC','2015-02-12 13:55:33','2015-02-12 13:55:33',1,'http://image.1jlc.com/upload/1435297711616_21.jpg',NULL,NULL,NULL,NULL),(00000000008,'1231','321','AF4120900EA653BC','2015-02-12 14:47:09','2015-02-12 14:47:09',1,'http://image.1jlc.com/upload/fishmanage/1435919016507_21.jpg',NULL,NULL,NULL,NULL),(00000000009,'asasas','sasa111','AF4120900EA653BC','2015-02-12 15:09:32','2015-02-12 15:09:32',1,'http://image.1jlc.com/upload/fishmanage/1442222338278_21.jpg',NULL,NULL,NULL,NULL),(00000000010,'as1212','as121321','AF4120900EA653BC','2015-02-12 15:10:50','2015-02-12 15:10:50',1,'http://image.1jlc.com/upload/1435297566494_21.jpg',NULL,NULL,NULL,NULL),(00000000011,'dsadqewq','大声道','AF4120900EA653BC','2015-02-12 22:58:20','2015-02-12 22:58:20',1,'http://image.1jlc.com/upload/1435543975912_21.jpg',NULL,NULL,NULL,NULL),(00000000012,'asddas','dsadsa','AF4120900EA653BC','2015-02-12 23:01:33','2015-02-12 23:01:33',1,'http://image.1jlc.com/upload/1435202270889_21.jpg',NULL,NULL,NULL,NULL),(00000000013,'e4wrewr','eqwwqe','AF4120900EA653BC','2015-02-12 23:03:52','2015-02-12 23:03:52',1,NULL,NULL,NULL,NULL,NULL),(00000000014,'xujinyang','徐晋阳','AF4120900EA653BC','2015-05-08 10:38:00','2015-05-08 10:38:00',3,NULL,NULL,NULL,NULL,NULL),(00000000015,'cyh','陈益辉','D2833AF8DCA4D112','2015-05-26 15:48:14','2015-11-25 19:42:00',5,'http://image.1jlc.com/upload/1435204171987_21.jpg',NULL,NULL,NULL,NULL),(00000000016,'zhdy','张迪','231091C9CB136AAE4DB362BE9AFA18AF','2015-06-01 17:55:40','2016-03-15 15:18:31',1,'http://image.1jlc.com/upload/fishmanage/1438067790844_19.jpg',NULL,NULL,NULL,NULL),(00000000017,'','wgi','DB28AA6FD8CC0B774DB362BE9AFA18AF','2015-06-01 20:44:27','2015-11-12 16:02:17',3,'http://image.1jlc.com/upload/1435543887110_21.jpg',NULL,NULL,NULL,NULL),(00000000018,'伤心城市','是的撒','B4B9DDC063795BC74DB362BE9AFA18AF','2015-06-01 22:21:58','2015-06-01 22:21:58',1,NULL,NULL,NULL,NULL,NULL),(00000000019,'test','测试','AF4120900EA653BC','2015-06-12 14:50:14','2016-03-16 14:28:04',2,'http://image.1jlc.com/upload/fishmanage/1438753702009_19.png',NULL,NULL,NULL,NULL),(00000000020,'tttt','啥打算的撒','AF4120900EA653BC','2015-06-12 15:01:59','2015-06-12 15:01:59',3,'http://image.1jlc.com/upload/1435300186791_21.jpg',NULL,NULL,NULL,NULL),(00000000021,'luolun','罗伦','A366FE02B6DAC8F0','2015-06-15 10:05:16','2016-03-07 15:15:30',1,'http://image.1jlc.com/upload/1435203759754_21.jpg',NULL,NULL,NULL,NULL),(00000000022,'root','root','A366FE02B6DAC8F0','2015-07-13 17:26:35','2017-03-16 12:08:47',1,'http://image.1jlc.com/upload/fishmanage/1438759905106_22.png',NULL,NULL,NULL,NULL),(00000000023,'luchunxiao','luchunxiao','A366FE02B6DAC8F0','2015-09-25 17:09:25','2015-09-25 17:17:26',4,NULL,NULL,NULL,NULL,NULL),(00000000024,'hulinyun','hulinyun','9966A318493AEAA94DB362BE9AFA18AF','2015-11-03 12:34:16','2016-02-25 12:08:33',1,NULL,NULL,NULL,NULL,NULL),(00000000025,'huyuwei','胡宇伟','A366FE02B6DAC8F0','2015-11-06 18:31:37','2016-03-02 18:38:01',1,NULL,NULL,NULL,NULL,NULL),(00000000026,'hao','hao','AB7A094292018983','2015-12-17 13:08:59','2016-03-31 16:43:04',1,NULL,NULL,NULL,NULL,NULL),(00000000027,'李栋','','A366FE02B6DAC8F0','2016-03-17 09:06:35','2016-03-25 09:47:14',1,NULL,NULL,NULL,NULL,NULL),(00000000029,'testdc','tdc','A366FE02B6DAC8F0','2016-03-17 11:23:47','2016-03-29 16:11:38',6,NULL,1,'MM平台包','ydmm',1),(00000000030,'testdc2','tdc2','A366FE02B6DAC8F0','2016-03-18 14:09:01','2016-03-18 14:09:01',6,NULL,0,NULL,'',1),(00000000031,'潘玮磬','潘玮磬','A366FE02B6DAC8F0','2016-03-24 18:48:30','2016-03-24 19:05:12',7,NULL,NULL,NULL,NULL,NULL),(00000000032,'王晓冬','王晓冬','A366FE02B6DAC8F0','2016-03-24 19:03:49','2016-03-25 17:28:45',7,NULL,NULL,NULL,NULL,NULL),(00000000033,'叶晓玥','叶晓玥','A366FE02B6DAC8F0','2016-03-24 19:04:02','2016-03-25 09:26:53',7,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `t_c3p0_test` */

DROP TABLE IF EXISTS `t_c3p0_test`;

CREATE TABLE `t_c3p0_test` (
  `a` char(1) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_c3p0_test` */

/* Procedure structure for procedure `test` */

/*!50003 DROP PROCEDURE IF EXISTS  `test` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `test`()
Begin
		SELECT * from manage_user where user_name='root';
		SELECT 'hehe';
	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
