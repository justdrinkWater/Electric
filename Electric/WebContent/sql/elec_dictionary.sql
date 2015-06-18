/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.21-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `elec_dictionary` (
	`SeqID` int (11),
	`Keyword` varchar (60),
	`DdlCode` int (11),
	`DdlName` varchar (150)
); 
insert into `elec_dictionary` (`SeqID`, `Keyword`, `DdlCode`, `DdlName`) values('10','是否在职','1','是');
insert into `elec_dictionary` (`SeqID`, `Keyword`, `DdlCode`, `DdlName`) values('11','是否在职','2','否');
insert into `elec_dictionary` (`SeqID`, `Keyword`, `DdlCode`, `DdlName`) values('12','是否在职','3','试用期');
insert into `elec_dictionary` (`SeqID`, `Keyword`, `DdlCode`, `DdlName`) values('13','是否在职','4','打酱油');
insert into `elec_dictionary` (`SeqID`, `Keyword`, `DdlCode`, `DdlName`) values('14','性别','1','男');
insert into `elec_dictionary` (`SeqID`, `Keyword`, `DdlCode`, `DdlName`) values('15','性别','2','女');
insert into `elec_dictionary` (`SeqID`, `Keyword`, `DdlCode`, `DdlName`) values('16','性别','3','不确定');
insert into `elec_dictionary` (`SeqID`, `Keyword`, `DdlCode`, `DdlName`) values('17','地点','1','北京');
insert into `elec_dictionary` (`SeqID`, `Keyword`, `DdlCode`, `DdlName`) values('18','地点','2','上海');
insert into `elec_dictionary` (`SeqID`, `Keyword`, `DdlCode`, `DdlName`) values('19','地点','3','广州');
insert into `elec_dictionary` (`SeqID`, `Keyword`, `DdlCode`, `DdlName`) values('20','角色类型','1','系统管理员');
insert into `elec_dictionary` (`SeqID`, `Keyword`, `DdlCode`, `DdlName`) values('21','角色类型','2','高级管理员');
insert into `elec_dictionary` (`SeqID`, `Keyword`, `DdlCode`, `DdlName`) values('22','角色类型','3','中级管理员');
insert into `elec_dictionary` (`SeqID`, `Keyword`, `DdlCode`, `DdlName`) values('23','角色类型','4','业务用户');
insert into `elec_dictionary` (`SeqID`, `Keyword`, `DdlCode`, `DdlName`) values('24','角色类型','5','一般用户');
insert into `elec_dictionary` (`SeqID`, `Keyword`, `DdlCode`, `DdlName`) values('25','角色类型','6','普通用户');
