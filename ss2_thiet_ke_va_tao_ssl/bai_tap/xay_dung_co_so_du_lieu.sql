drop database if exists QuanLyBanHang;
create database QuanLyBanHang;
use  QuanLyBanHang;
create table Customer(
cID int primary key,
cName varchar(30),
cAge int 
);
create table Oder(
oId int primary key,
cid int ,
foreign key(cID) references Customer(cId),
oDate datetime,
oTotalPrice double
);
create table Product(
pId int primary key,
pName varchar(30),
pPrice double
);
create table OrderDetail(
odQTY varchar(30),
oID int,
pID int ,
primary key(oId,pID),
foreign key(oID) references Oder(oID),
foreign key(pID) references Product(pID)
);
create database QuanLyBanHang
