drop database if exists MoHinhQuanHe;
create database MoHinhQuanHe;
use MoHinhQuanHe;
create table PhieuXuat(
soPX int primary key,
ngaySuat datetime
);
create table VatTu(
maVTU int primary key,
tenVTU varchar (20)

);
create table PhieuNhap(
soPN int primary key,
ngayNhap datetime
);
create table ChiTietPhieuXuat(
DGxuat double,
SLxuat int,
soPx int,
maVTU int,
primary key(soPx,maVTU),
foreign key (soPx) references PhieuXuat(soPx),
foreign key (maVTU) references VatTu(maVTU)
);
create table ChiTietPhieuNhap(
DGnhap double,
SLnhap int,
maVTU int,
soPN int,
primary key(maVTU,soPN),
foreign key(maVTU) references VatTu(maVTU),
foreign key(soPN) references PhieuNhap(soPN)
);
create table DonDatHang(
soDH int primary key,
ngayDH datetime,
maNCC int

);
create table ChiTietDonDatHang(
maVTU int,
soDH int,
primary key(maVTU,soDH),
foreign key (maVTU) references VatTu(maVtu),
foreign key (soDH) references  DonDatHang(soDH)
);
create table sdt(
soDienThoai varchar(10),
maPhone int primary key

);

create table NHACC(
maNCC int primary key,
tenNCC varchar(20),
diaChi varchar(30),
maPhone int,
foreign key(maPhone) references sdt(maPhone)

);
create table CungCap(
soDH int,
maNCC int ,
foreign key (soDH) references DonDatHang (soDH),
foreign key (maNCC) references NHACC(maNCC)

);
