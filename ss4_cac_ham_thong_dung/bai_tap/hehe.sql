use QuanLySinhVien;
select*
from sub_ject
where sub_ject.credit =(select max(credit)from sub_ject);

select sub_ject.sub_name,sub_ject.sub_id,mark.mark
from sub_ject
join mark on sub_ject.sub_id=mark.sub_id
where mark.mark=(select max(mark)from mark);

select s.student_id, s.student_name,avg(mark)
from student s 
join  mark on s.student_id=mark.student_id
group by s.student_id, s.student_name;
