package com.springmvc.service;

public class SQL_entity {
    /*执行sql语句之前请找到mysql下my.ini文件找到语句default-character-set 将=号后面改为utf8， default-character-set后面改为gbk
drop database company;
create database company;
use company;

drop table userTable if exists;
create table userTable(
id int NOT NULL primary key auto_increment,
usingCondition varchar(20)  NOT NULL,
rank int NOT NULL,
password varchar(20),
account varchar(20) NOT NULL,
registerYear int NOT NULL,
registerMouth int NOT NULL,
registerDay int NOT NULL,
unregisterYear int,
unregisterMouth int,
unregisterDay int,
accompanyName varchar(100) NOT NULL) default charset=utf8;

drop table companyTable if exists;
create table companyTable(
originalArea varchar(50) NOT NULL,
id int NOT NULL primary key,
name varchar(50) NOT NULL,
nameCode varchar(10) NOT NULL,
enterprisesNature varchar(50) NOT NULL,
industry varchar(50) NOT NULL,
mainBusiness varchar(50) NOT NULL,
People varchar(50) NOT NULL,
Address varchar(50) NOT NULL,
postalCode varchar(50) NOT NULL,
telephone varchar(50) NOT NULL,
fax varchar(50) NOT NULL,
email varchar(50)) default charset = utf8;

drop table companyDataTable if exists;
create table companyDataTable(
id int NOT NULL,
csPeople int NOT NULL,
surveyPeople int NOT NULL,
addition varchar(50),
reduceType varchar(50),
mainReason varchar(50),
mR_instruction varchar(50),
secondReason varchar(50),
sR_instruction varchar(50),
thirdReason varchar(50),
tR_instruction varchar(50),
accountYear int NOT NULL,
accountMonth int NOT NULL,
accountDay int NOT NULL,
accountSeason int NOT NULL) default charset = utf8;

drop table browserTable if exists;
create table browserTable(
browserYear int NOT NULL,
browserMonth int NOT NULL,
browserDay int NOT NULL,
content varchar(100)) default charset=utf8;

drop table notificationTable if exists;
create table notificationTable(
notification_id int NOT NULL primary key,
title varchar(50) NOT NULL,
content varchar(4000) NOT NULL,
publishYear int NOT NULL,
publishMonth int NOT NULL,
publishDay int NOT NULL,
id int NOT NULL) default charset = utf8;

insert into userTable(usingCondition,rank,password,account,registerYear,registerMouth,registerDay,accompanyName) values(
'online',1,'123','1000001',2018,3,19,'table1');
insert into userTable(usingCondition,rank,password,account,registerYear,registerMouth,registerDay,accompanyName) values(
'online',1,'123','1000002',2018,3,19,'table2');
insert into userTable(usingCondition,rank,password,account,registerYear,registerMouth,registerDay,accompanyName) values(
'online',1,'123','1000003',2018,3,19,'table3');
insert into userTable(usingCondition,rank,password,account,registerYear,registerMouth,registerDay,accompanyName) values(
'online',1,'123','1000004',2018,3,19,'table4');
insert into userTable(usingCondition,rank,password,account,registerYear,registerMouth,registerDay,accompanyName) values(
'online',2,'123','1000005',2018,3,19,'济南市政府');
insert into userTable(usingCondition,rank,password,account,registerYear,registerMouth,registerDay,accompanyName) values(
'online',2,'123','1000006',2018,3,19,'青岛市政府');
insert into userTable(usingCondition,rank,password,account,registerYear,registerMouth,registerDay,accompanyName) values(
'online',3,'123','1000007',2018,3,19,'山东省政府');

insert into companyTable(originalArea,id,name,nameCode,enterprisesNature,industry,mainBusiness,People,Address,postalCode,telephone,fax,email)
values ('济南',1,'table1','table5','国有企业','制造业','unknow1','wang','济南','250000','123','123','123');
insert into companyTable(originalArea,id,name,nameCode,enterprisesNature,industry,mainBusiness,People,Address,postalCode,telephone,fax,email)
values ('济南',2,'table2','table6','集体企业','服务业','unknow2','wang','济南','250000','123','123','123');
insert into companyTable(originalArea,id,name,nameCode,enterprisesNature,industry,mainBusiness,People,Address,postalCode,telephone,fax,email)
values ('青岛',3,'table3','table7','国有企业','制造业','unknow1','wang','青岛','266000','123','123','123');
insert into companyTable(originalArea,id,name,nameCode,enterprisesNature,industry,mainBusiness,People,Address,postalCode,telephone,fax,email)
values ('青岛',4,'table4','table8','集体企业','服务业','unknow2','wang','青岛','266000','123','123','123');
insert into companyTable(originalArea,id,name,nameCode,enterprisesNature,industry,mainBusiness,People,Address,postalCode,telephone,fax,email)
values ('济南',5,'济南市政府','0531','政府','政府','政府','wang','济南','250000','123','123','123');
insert into companyTable(originalArea,id,name,nameCode,enterprisesNature,industry,mainBusiness,People,Address,postalCode,telephone,fax,email)
values ('青岛',6,'青岛市政府','0532','政府','政府','政府','wang','济南','266000','123','123','123');
insert into companyTable(originalArea,id,name,nameCode,enterprisesNature,industry,mainBusiness,People,Address,postalCode,telephone,fax,email)
values ('济南',7,'山东省政府','05','政府','政府','政府','wang','济南','266000','123','123','123');

select * from userTable;
select * from companyTable;
     */
}
