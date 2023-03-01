--1. Liệt kê danh sách tất cả các nhân viên
Select *
From NHANVIEN
--2.Tìm các nhân viên làm việc ở phòng số 5
Select *
From NHANVIEN Where PHG = 5
--3. Liệt kê họ tên và phòng làm việc các nhân viên có mức lương trên 6.000.000 đồng
Select HONV, TENNV, PHG
From NHANVIEN
where LUONG > 6000000
--4. Tìm các nhân viên có mức lương trên 6.500.000 ở phòng 1 hoặc các nhân viên có mức lương trên 5.000.000 ở phòng 4
Select *
From NHANVIEN
Where LUONG > 6500000 and PHG = 1 OR PHG = 4 and LUONG > 5000000
--5. Cho biết họ tên đầy đủ của các nhân viên ở TP Quảng Ngãi
Select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ Và Tên'
From NHANVIEN 
Where Nhanvien.DCHI like N'%Quảng Ngãi'
Select *
From NHANVIEN
--6. Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự &#39;N&#39;
Select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ Và Tên'
From NHANVIEN
Where NHANVIEN.HONV like N'N%'
--7.Cho biết ngày sinh và địa chỉ của nhân viên Cao Thanh Huyền
Select NGSINH,DCHI
From NHANVIEN
Where HONV = N'Cao' and TENLOT=N'Thanh' and TENNV=N'Huyền'
--8. Cho biết các nhân viên có năm sinh trong khoảng 1955 đến 1975
Select *
From NHANVIEN
Where Year(NGSINH) Between 1955 and 1975
--9. Cho biết các nhân viên và năm sinh của nhân viên
Select TENNV,Year(NGSINH) as 'Năm sinh'
From NHANVIEN
--10. Cho biết họ tên và tuổi của tất cả các nhân viên
Select HONV,TENNV,Year(getdate())-Year(NGSINH) as 'Tuổi'
From NHANVIEN
--11. Tìm tên những người trưởng phòng của từng phòng ban
Select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ Và Tên Trưởng Phòng'
From PHONGBAN,NHANVIEN
Where PHONGBAN.TRPHG=NHANVIEN.MANV
--12. Tìm tên và địa chỉ của tất cả các nhân viên của phòng "Điều hành"
Select TENNV,DCHI
From PHONGBAN,NHANVIEN
Where PHONGBAN.MAPHG = NHANVIEN.PHG and TENPHG like N'Điều hành'
Select*
From phongban
--13. Với mỗi đề án ở Tp Quảng Ngãi, cho biết tên đề án, tên phòng ban, họ tên và ngày nhận chức của trưởng phòng của phòng ban chủ trì đề án đó.
Select TENDEAN,TENPHG,HONV,TENNV
From NHANVIEN,PHONGBAN,DEAN
Where NHANVIEN.MANV = PHONGBAN.TRPHG and PHONGBAN.MAPHG = DEAN.PHONG and DEAN.DDIEM_DA like N'Quảng Ngãi'
Select*
From phongban
Select*
From DEAN
--14. Tìm tên những nữ nhân viên và tên người thân của họ
Select TENNV,TENTN
From NHANVIEN,THANNHAN
Where NHANVIEN.MANV = THANNHAN.MA_NVIEN and NHANVIEN.PHAI like N'Nữ'
--15. Với mỗi nhân viên, cho biết họ tên của nhân viên, họ tên trưởng phòng của phòng ban mà nhân viên đó đang làm việc.
Select nv.HONV+ ' ' +nv.TENLOT+ ' ' +nv.TENNV as 'Họ Và Tên nv', tp.HONV+ ' ' +tp.TENLOT+ ' ' +tp.TENNV as 'Họ Và Tên Trưởng Phòng'
From NHANVIEN nv,NHANVIEN tp,PHONGBAN pb
Where tp.manv = pb.TRPHG and nv.phg = tp.phg
--16. Tên những nhân viên phòng Nghiên cứu có tham gia vào đề án "Xây dựng nhà máy chế biến thủy sản".
Select nv.TENNV
From NHANVIEN nv, DEAN da
Where nv.PHG = da.PHONG and nv.PHG = 5 and da.TENDEAN like N'Xây dựng nhà máy chế biến thủy sản'
--17. Cho biết tên các đề án mà nhân viên Trần Thanh Tâm đã tham gia.
Select DEAN.TENDEAN
From NHANVIEN,PHANCONG,DEAN
Where NHANVIEN.MANV = PHANCONG.MA_NVIEN and PHANCONG.MADA= DEAN.MADA and HONV = N'Trần' and TENLOT=N'Thanh' and TENNV=N'Tâm'
