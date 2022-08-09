create database QuanLyDiemThi;
use QuanLyDiemThi;
create table HocSinh(
maHocSinh varchar(20) primary key,
tenHocSinh varchar(20) ,
ngaySinh datetime,
lop varchar(20),
gioiTinh varchar(20)
);
create table MonHoc(
maMonHoc varchar(20) primary key,
tenMonHoc varchar(20),
maGiaoVien varchar(20)
);
create table BangDiem(
maHocSinh varchar(20) ,
maMonHoc varchar (20),
diemThi double,
ngayKiemTra datetime,
primary key (maHocSinh,maMonHoc),
foreign key(maHocSinh) references HocSinh(maHocSinh),
foreign key(maMonHoc) references MonHoc(maMonHoc)
);
create table GiaoVien(
maGiaoVien varchar (20) primary key,
tenGiaoVien varchar(20),
soDienThoai varchar(20)
);