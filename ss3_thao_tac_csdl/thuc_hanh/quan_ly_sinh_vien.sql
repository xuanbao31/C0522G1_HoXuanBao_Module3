drop database if exists QuanLySinhVien;
create database QuanLySinhVien;
use QuanLySinhVien;
create table class (
class_id int auto_increment primary key,
class_name varchar(60) not null,
start_date datetime not null ,
statuss bit 
);
create table student(
student_id int auto_increment primary key,
student_name varchar(30)not null,
address varchar (50),
phone varchar(20),
statuss bit,
class_id int not null
);
create table sub_ject(
sub_id int auto_increment primary key,
sub_name varchar(30) not null ,
credit tinyint not null default 1 check (credit>=1),
statuss bit default 1	
);
create table mark(
mark_id int auto_increment primary key,
sub_id int not null,
student_id int not null,
mark float default 0 check  (mark between 0 and 100),
exam_times tinyint default 1,
foreign key (student_id) references student(student_id),
foreign key (sub_id) references sub_ject (sub_id)	

);