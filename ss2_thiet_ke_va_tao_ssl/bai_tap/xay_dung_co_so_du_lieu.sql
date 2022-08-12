drop database if exists QuanLyBanHang;
create database QuanLyBanHang;
use  QuanLyBanHang;
create table Customer(
cID int primary key auto_increment,
cName varchar(30),
cAge int 
);
create table Oder(
oId int primary key auto_increment,
cID int ,
foreign key(cID) references Customer(cId),
oDate datetime,
ototal_price double
);
create table Product(
pId int primary key auto_increment,
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

insert into Customer(cName,cAge)
values
('Minh Quan',10),
('Ngoc Oanh',20),
('Hong Ha',50);

insert into Oder(cID, odate,ototal_price)
values
(1,'2006/3/21',null),
(2,'2006/3/23',null),
(1,'2006/3/16',null);

insert into Product(pName,pPrice)
values
('May Giat',3),
('Tu Lanh',5),
('Dieu Hoa',7),
('Quat',1),
('Bep Dien',2);

insert into OderDetail(odQTY,oId,pID)
values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

select oID,oDate,ototal_price
from Oder;

select Customer.cName,Product.pName,Oder.odate
from Customer
join Oder on Customer.cID= Oder.cID
join OderDetail on OderDetail.oID=Oder.oID
join Product on Product.pID=OderDetail.pID;

select *
from Customer
Where Customer.cID not in (Select Oder.cID from Oder);


