use QuanLySinhVien;
select *
from student s
where s.student_name like'h%';
select *
from class s
where (month(s.start_date)=12);
select *
from sub_ject s 
where s.credit between 3 and 5;

set sql_safe_updates=0;
update student set class_id = 2 where student_name = 'hung' ;

