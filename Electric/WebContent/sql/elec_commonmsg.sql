/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.21-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `elec_commonmsg` (
	`ComID` varchar (150),
	`StationRun` varchar (3000),
	`DevRun` varchar (3000),
	`CreateDate` datetime 
); 
insert into `elec_commonmsg` (`ComID`, `StationRun`, `DevRun`, `CreateDate`) values('1','今天天气很好','OK',NULL);
insert into `elec_commonmsg` (`ComID`, `StationRun`, `DevRun`, `CreateDate`) values('2','坏了！','要加班了！',NULL);
insert into `elec_commonmsg` (`ComID`, `StationRun`, `DevRun`, `CreateDate`) values('4aa6d46e4dc415b3014dc417ccb80000','现在都几点了啊','靠，有加班！！','2015-06-05 00:00:00');
insert into `elec_commonmsg` (`ComID`, `StationRun`, `DevRun`, `CreateDate`) values('4aa6d46e4dc415b3014dc41963240001','快点下班啊，，，曹操曹操','草啊哦草草','2015-06-05 00:00:00');
insert into `elec_commonmsg` (`ComID`, `StationRun`, `DevRun`, `CreateDate`) values('4028b8814dc45df2014dc45efb150000','现在是23:37\r\n<br>\r\n有点困了<br>\r\n怎么办<br>\r\n','下班了哦<br>\r\n','2015-06-05 00:00:00');
insert into `elec_commonmsg` (`ComID`, `StationRun`, `DevRun`, `CreateDate`) values('4028b8814dc48225014dc4838b7a0000','今天六月六号了啊<br>\r\n还有两天就高考了哦<br>\r\n好紧张啊<br>\r\n','紧张死了','2015-06-06 00:00:00');
insert into `elec_commonmsg` (`ComID`, `StationRun`, `DevRun`, `CreateDate`) values('4028b8814de6b422014de6b52dc50000','明天就靠六级了啊','好紧张啊 ','2015-06-12 00:00:00');
insert into `elec_commonmsg` (`ComID`, `StationRun`, `DevRun`, `CreateDate`) values('4028b8814df0c9f8014df0cb1f060000','wocao','wocao','2015-06-14 00:00:00');
insert into `elec_commonmsg` (`ComID`, `StationRun`, `DevRun`, `CreateDate`) values('4028b8814df0c9f8014df0cb86bc0001','今天没啥事啊','今天没啥事啊','2015-06-14 00:00:00');
