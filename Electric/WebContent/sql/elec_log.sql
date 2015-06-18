/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.21-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `elec_log` (
	`LogID` varchar (150),
	`IpAddress` varchar (150),
	`OpeName` varchar (150),
	`OpeTime` datetime ,
	`Details` varchar (1500)
); 
insert into `elec_log` (`LogID`, `IpAddress`, `OpeName`, `OpeTime`, `Details`) values('4028b8814dfca460014dfca4e9380001','127.0.0.1','诸葛亮','2015-06-16 00:00:00','登录了本系统');
insert into `elec_log` (`LogID`, `IpAddress`, `OpeName`, `OpeTime`, `Details`) values('4028b8814dfcc437014dfcc4b2250000','127.0.0.1','刘备','2015-06-16 00:00:00','登录了本系统');
insert into `elec_log` (`LogID`, `IpAddress`, `OpeName`, `OpeTime`, `Details`) values('4028b8814dfcc760014dfcc7b48f0000','127.0.0.1','刘备','2015-06-16 00:00:00','登录了本系统');
insert into `elec_log` (`LogID`, `IpAddress`, `OpeName`, `OpeTime`, `Details`) values('4028b8814dfcca0e014dfccad8b80000','127.0.0.1','刘备','2015-06-16 00:00:00','登录了本系统');
insert into `elec_log` (`LogID`, `IpAddress`, `OpeName`, `OpeTime`, `Details`) values('4028b8814dfccfbc014dfcd1d29a0000','127.0.0.1','赵云','2015-06-16 00:00:00','登录了本系统');
insert into `elec_log` (`LogID`, `IpAddress`, `OpeName`, `OpeTime`, `Details`) values('4028b8814dff4ac4014dff4b35130000','127.0.0.1','admin','2015-06-17 00:00:00','登录了本系统');
insert into `elec_log` (`LogID`, `IpAddress`, `OpeName`, `OpeTime`, `Details`) values('4028b8814e06e909014e06ea2ffe0000','127.0.0.1','admin','2015-06-18 00:00:00','登录了本系统');
insert into `elec_log` (`LogID`, `IpAddress`, `OpeName`, `OpeTime`, `Details`) values('4028b8814e06e909014e06eaeb230001','127.0.0.1','admin','2015-06-18 00:00:00','登录了本系统');
insert into `elec_log` (`LogID`, `IpAddress`, `OpeName`, `OpeTime`, `Details`) values('4028b8814e070d79014e070dcb960000','127.0.0.1','admin','2015-06-18 00:00:00','登录了本系统');
