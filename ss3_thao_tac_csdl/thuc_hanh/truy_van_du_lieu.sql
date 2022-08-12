use QuanLySinhVien;
SELECT Address, COUNT(student_id) AS 'Số lượng học viên'
FROM student
GROUP BY Address;
-- Tính điểm trung bình các môn học của mỗi học viên
select s.student_id, s.student_name,avg(mark)
from student s 
join  mark on s.student_id=mark.student_id
group by s.student_id, s.student_name;
-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
select s.student_id, s.student_name,avg(mark)
from student s 
join  mark on s.student_id=mark.student_id
group by s.student_id, s.student_name
having avg(mark) > 15;
-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất
select s.student_id, s.student_name,avg(mark)
from student s 
join  mark on s.student_id=mark.student_id
group by s.student_id, s.student_name
having avg (mark)>= all(select AVG(Mark) FROM Mark GROUP BY Mark.StudentId);9