use QuanLySinhVien;
select *
FROM sub_ject
WHERE credit < 10;
-- hiển thị danh sách các học viên đang đi học 
select  student.student_id,student.student_name,class.class_name
from student 
join class on student.student_id=class.class_id;
-- hiển thị danh sách học viên lớp A1
select student.student_id,student.student_name,class_name
from student 
left join class on student.class_id=class.class_id
where class.class_name="A1";	
-- hiển thị danh sách điểm thi 
select student.student_id,student.student_name,sub_ject.sub_name,mark.mark
from student
join mark on student.student_id=mark.student_id
join sub_ject on mark.sub_id=sub_ject.sub_id
where sub_ject.sub_name="CF";


