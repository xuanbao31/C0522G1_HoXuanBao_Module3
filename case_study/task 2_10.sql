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

-- select 
select khach_hang.ma_khach_hang,khach_hang.ho_ten,loai_khach.ten_loai_khach,hop_dong.ma_hop_dong,
dich_vu.ten_dich_vu,hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc,
ifnull((dich_vu.chi_phi_thue),0)+ifnull((hop_dong_chi_tiet.so_luong),0)*ifnull((dich_vu_di_kem.gia),0) as tong_tien
from khach_hang
left join loai_khach on khach_hang.ma_loai_khach= loai_khach.ma_loai_khach
left join hop_dong on khach_hang.ma_khach_hang=hop_dong.ma_khach_hang
left join dich_vu on  hop_dong.ma_dich_vu=dich_vu.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong=hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem=dich_vu_di_kem.ma_dich_vu_di_kem;


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

select distinct dich_vu.*
from dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu= loai_dich_vu.ma_loai_dich_vu
join hop_dong on dich_vu.ma_dich_vu=hop_dong.ma_dich_vu
where (year(ngay_lam_hop_dong)=2020)and dich_vu.ma_dich_vu not in(
select dich_vu.ma_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu= loai_dich_vu.ma_loai_dich_vu
join hop_dong on dich_vu.ma_dich_vu=hop_dong.ma_dich_vu
where (year(ngay_lam_hop_dong)=2021)
group by ma_khach_hang)
;

--  9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(hop_dong.ngay_lam_hop_dong) as thang , count(hop_dong.ma_khach_hang) as so_luong_khach_hang
from hop_dong
where year(ngay_lam_hop_dong)=2021
group by thang
order by thang;

-- 10. 	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
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

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là 
-- “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
 select dich_vu_di_kem.ma_dich_vu_di_kem,dich_vu_di_kem.ten_dich_vu_di_kem
 from dich_vu_di_kem
 join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem=hop_dong_chi_tiet.ma_dich_vu_di_kem
   join hop_dong on hop_dong_chi_tiet.ma_hop_dong=hop_dong.ma_hop_dong
  join khach_hang on hop_dong.ma_khach_hang=khach_hang.ma_khach_hang
join loai_khach on khach_hang.ma_loai_khach=loai_khach.ma_loai_khach
 where loai_khach.ten_loai_khach='Diamond' and khach_hang.dia_chi like '%Vinh' or '%Quang Ngai';
 
 -- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
    -- ten_dich_vu, so_luong_dich_vu_di_kem
 -- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
 -- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
 
 select hop_dong.ma_hop_dong, nhan_vien.ho_ten as ho_ten_nhan_vien,khach_hang.ho_ten as ho_ten_khach_hang,
 khach_hang.so_dien_thoai as so_dien_thoai_khach_hang,dich_vu.ma_dich_vu,dich_vu.ten_dich_vu, sum(ifnull(hop_dong_chi_tiet.so_luong,0)) as so_luong_dich_vu_di_kem,
 hop_dong.tien_dat_coc
 from dich_vu
 join hop_dong on dich_vu.ma_dich_vu=hop_dong.ma_dich_vu
 join nhan_vien on hop_dong.ma_nhan_vien=nhan_vien.ma_nhan_vien
 join khach_hang on hop_dong.ma_khach_hang=khach_hang.ma_khach_hang
 join hop_dong_chi_tiet on hop_dong.ma_hop_dong=hop_dong_chi_tiet.ma_hop_dong
 where year(hop_dong.ngay_lam_hop_dong)=2020 and month(hop_dong.ngay_lam_hop_dong) between 10 and 12 and hop_dong.ma_hop_dong not in
 (select hop_dong.ma_hop_dong
        from hop_dong
        where (month(hop_dong.ngay_lam_hop_dong) between 1 and 6
                and year(hop_dong.ngay_lam_hop_dong) = 2021))
                group by hop_dong.ma_hop_dong;
 
 -- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
 -- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
  


-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm 
-- ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select hop_dong.ma_hop_dong,loai_dich_vu.ten_loai_dich_vu,
dich_vu_di_kem.ten_dich_vu_di_kem,count(hop_dong_chi_tiet.ma_dich_vu_di_kem) as so_lan_su_dung
from loai_dich_vu
join dich_vu on loai_dich_vu.ma_loai_dich_vu=dich_vu.ma_loai_dich_vu
join hop_dong on dich_vu.ma_dich_vu=hop_dong.ma_dich_vu
join hop_dong_chi_tiet on hop_dong.ma_hop_dong=hop_dong_chi_tiet.ma_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem=dich_vu_di_kem.ma_dich_vu_di_kem
group by dich_vu_di_kem.ten_dich_vu_di_kem
having so_lan_su_dung=1
order by hop_dong.ma_hop_dong;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai,
--  dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nhan_vien.ma_nhan_vien,nhan_vien.ho_ten,trinh_do.ten_trinh_do,
bo_phan.ten_bo_phan,nhan_vien.so_dien_thoai,nhan_vien.dia_chi
from hop_dong 
join nhan_vien  on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
 join bo_phan  on nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan
join trinh_do  on nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do
group by nhan_vien.ma_nhan_vien
having COUNT(nhan_vien.ma_nhan_vien) <= 3;
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
select nhan_vien.ma_nhan_vien, nhan_vien.ho_ten,hop_dong.ma_hop_dong
from hop_dong
 right join nhan_vien on hop_dong.ma_nhan_vien=nhan_vien.ma_nhan_vien
where hop_dong.ma_hop_dong 
group by nhan_vien.ma_nhan_vien
order by nhan_vien.ma_nhan_vien ;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
 -- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
SELECT
            hd.ma_khach_hang,
                (dv.chi_phi_thue + IFNULL(hdct.so_luong * dvdk.gia, 0)) AS tong_tien
        FROM
            khach_hang kh
                LEFT JOIN
            loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
                LEFT JOIN
            hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
                LEFT JOIN
            dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
                LEFT JOIN
            hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
                LEFT JOIN
            dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2021
                AND ten_loai_khach = 'Platinium'
        GROUP BY ma_khach_hang
        HAVING tong_tien > 100000;





