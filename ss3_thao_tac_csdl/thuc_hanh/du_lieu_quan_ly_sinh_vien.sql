use QuanLySinhVien;
Insert into class (class_name,start_date,statuss)
values 
('A1','2018/12/20',1),
('A2','2018/12/22',1),
('B3',current_date,0);
insert into student(student_name,address,phone,statuss,class_id)
values 
('Hung','Ha noi','0912113113',1,1),
('Hoa','Hai phong','',1,1),
('Manh','Hồ chí minh','0123123123',0,2);
insert into sub_ject(sub_name,credit,statuss)
values
('CF',5,1),
('C',6,1),
('HDJ',5,1),
('RDBMS',10,1);
insert into mark(sub_id,student_id,mark,exam_times)
values 
(1, 1, 8, 1),
(1, 2, 10, 2),
(2, 1, 12, 1);