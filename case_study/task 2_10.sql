use furama_resort;
-- task 2:
select*
 from nhan_vien 
 where 
 ho_ten like 'h%' or
 ho_ten like 't%'or
 ho_ten like 'k%' and
 length(ho_ten)<=15;
 -- task 3:
 select*
from khach_hang
where (dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị') and (year(now())-year(ngay_sinh)between 18 and 50) ;
-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select khach_hang.ma_khach_hang,khach_hang.ho_ten,count(hop_dong.ma_khach_hang)as so_lan_dat_phong
from khach_hang
join hop_dong on khach_hang.ma_khach_hang= hop_dong.ma_khach_hang
join loai_khach on khach_hang.ma_loai_khach=loai_khach.ma_loai_khach
 where loai_khach.ten_loai_khach ="Diamond"
group by hop_dong.ma_khach_hang
order by so_lan_dat_phong;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

-- select khach_hang.ma_khach_hang,khach_hang.ho_ten,loai_khach.ten_loai_khach,hop_dong.ma_hop_dong,dich_vu.ten_dich_vu,hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc ()as tong_tien
select *
from khach_hang
join hop_dong on khach_hang.ma_khach_hang=hop_dong.ma_khach_hang
join loai_khach on khach_hang.ma_loai_khach= loai_khach.ma_loai_khach
join dich_vu on  hop_dong.ma_dich_vu=dich_vu.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong=hop_dong_chi_tiet.ma_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem=dich_vu_di_kem.ma_dich_vu_di_kem;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu
--  của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select dich_vu.ma_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu=loai_dich_vu.ma_loai_dich_vu
where dich_vu.ma_dich_vu not in(
select hop_dong.ma_dich_vu
from hop_dong
join dich_vu on hop_dong.ma_dich_vu=dich_vu.ma_dich_vu
where (month(ngay_lam_hop_dong)between 1 and 3 and year(ngay_lam_hop_dong)=2021));
-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
 -- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020
 -- nhưng chưa từng được khách hàng đặt phòng trong năm 2021

select dich_vu.*
from dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu= loai_dich_vu.ma_loai_dich_vu
join hop_dong on dich_vu.ma_dich_vu=hop_dong.ma_dich_vu
where (year(ngay_lam_hop_dong)=2020)and dich_vu.ma_dich_vu not in(
select dich_vu.ma_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu= loai_dich_vu.ma_loai_dich_vu
join hop_dong on dich_vu.ma_dich_vu=hop_dong.ma_dich_vu
where (year(ngay_lam_hop_dong)=2021));

--  9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(hop_dong.ngay_lam_hop_dong) as thang , count(hop_dong.ma_khach_hang) as so_luong_khach_hang
from hop_dong
where year(ngay_lam_hop_dong)=2021
group by thang
order by thang;

-- 10. 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hop_dong.ma_hop_dong, 
hop_dong.ngay_lam_hop_dong, 
hop_dong.ngay_ket_thuc,
hop_dong.tien_dat_coc,
ifnull(sum(so_luong),0) as so_luong_dich_vu_di_kem
from hop_dong
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong=hop_dong_chi_tiet.ma_hop_dong
group by ma_hop_dong;


select hop_dong.ma_hop_dong,
 hop_dong.ngay_lam_hop_dong,
 hop_dong.ngay_ket_thuc,
 hop_dong.tien_dat_coc,
ifnull(sum(so_luong),0) as so_luong_dich_vu_di_kem
from hop_dong
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
group by ma_hop_dong
