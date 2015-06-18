/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.21-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `elec_text` (
	`textID` varchar (150),
	`textName` varchar (150),
	`textDate` datetime ,
	`textRemark` varchar (1500)
); 
insert into `elec_text` (`textID`, `textName`, `textDate`, `textRemark`) values('4aa6d4754db83e5d014db83e633e0001','测试Hibernate名称','2015-06-03 00:00:00','测试Hibernate备注');
insert into `elec_text` (`textID`, `textName`, `textDate`, `textRemark`) values('4aa6d49f4dbe26f8014dbe26faaf0000','测试DAO名称','2015-06-04 00:00:00','测试DAO备注');
insert into `elec_text` (`textID`, `textName`, `textDate`, `textRemark`) values('4aa6d49f4dbe3ff3014dbe4073310001','我是大神','2015-06-04 00:00:00','你有意见啊');
insert into `elec_text` (`textID`, `textName`, `textDate`, `textRemark`) values('4aa6d46e4dc3e22a014dc3e22dca0000','测试DAO名称','2015-06-05 00:00:00','测试DAO备注');
