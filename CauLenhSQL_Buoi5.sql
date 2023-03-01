--18. Cho biết số lượng đề án của công ty
Select count(*)
From dean
--19. Liệt kê danh sách các phòng ban có tham gia chủ trì các đề án
Select PHONGBAN.TENPHG, COUNT(DEAN.PHONG) AS 'Số lượng đề án'
From PHONGBAN, DEAN
Where PHONGBAN.MAPHG = DEAN.PHONG
Group by PHONGBAN.TENPHG
--20. Cho biết số lượng các phòng ban có tham gia chủ trì các đề án
Select TENPHG,count(*)
From PHONGBAN,DEAN
Where maphg=phong
Group by TENPHG
Select*
From DEAN
--21. Cho biết số lượng đề án do phòng Nghiên Cứu chủ trì
Select count(*)
From PHONGBAN,DEAN
Where PHONG=MAPHG and TENPHG like N'Nghiên cứu'
Select *
From dean
Select *
From PHANCONG
Select*
From NHANVIEN
--22. Cho biết lương trung bình của các nữ nhân viên
Select avg(LUONG) as 'Lương Trung Bình của các NV nữ'
From NHANVIEN
Where phai like N'Nữ'
--23. Cho biết số thân nhân của nhân viên Đinh Bá Tiến
Select count(*) as 'Số thân nhân của tiến'
From NHANVIEN,THANNHAN
Where MANV=MA_NVIEN and HONV = N'Đinh' and TENLOT=N'Bá' and TENNV=N'Tiến'
--24. Liệt kê danh sách 3 nhân viên lớn tuổi nhất, danh sách bao gồm họ tên và năm sinh.
Select top (3) HONV+' '+TENLOT+' '+TENNV as 'Họ Và Tên', max(YEAR(NGSINH)) as 'Năm sinh' from NHANVIEN
Group by HONV, TENLOT, TENNV
--25. Với mỗi đề án, liệt kê mã đề án và tổng số giờ làm việc của tất cả các nhân viên tham gia đề án đó.
Select DEAN.MADA,sum(THOIGIAN) as 'Tổng số giờ làm việc'
From DEAN,PHANCONG
Where dean.MADA = PHANCONG.MADA
Group by DEAN.MADA
--26. Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc của tất cả các nhân viên tham gia đề án đó.
Select TENDEAN,sum(THOIGIAN) as 'Tổng số giờ làm việc'
From DEAN,PHANCONG
Where dean.MADA = PHANCONG.MADA
Group by TENDEAN
--27. Với mỗi đề án, cho biết có bao nhiêu nhân viên tham gia đề án đó, thông tin bao gồm tên đề án và số lượng nhân viên.
Select PHANCONG.MADA, count(*) as 'số lượng nhân viên'
From PHANCONG,NHANVIEN,DEAN
Where MANV=MA_NVIEN
Group by PHANCONG.MADA
--28. Với mỗi nhân viên, cho biết họ và tên nhân viên và số lượng thân nhân của nhân viên đó.
Select HONV+' '+TENNV as 'Họ Và Tên',count(*) as 'Số lượng thân nhân'
From NHANVIEN,THANNHAN
Where MANV = MA_NVIEN
Group by HONV,TENNV
--29. Với mỗi nhân viên, cho biết họ tên của nhân viên và số lượng đề án mà nhân viên đó đã tham gia.
Select honv,tennv,count(*)
From NHANVIEN,PHANCONG
Where MANV=MA_NVIEN
Group by honv,tennv
--30. Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc cho phòng ban đó.
Select TENPHG,AVG(LUONG)
From PHONGBAN,NHANVIEN
Where maphg=PHG
Group by TENPHG
--31. Với các phòng ban có mức lương trung bình trên 5.200.000, liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó.
Select TENPHG,COUNT(*) as 'Số lượng nhân viên làm việc'
From PHONGBAN,NHANVIEN
Where MAPHG=PHG
Group by TENPHG
Having avg(LUONG)>5200000
--32. Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì
Select TENPHG,count(*)
From PHONGBAN,DEAN
Where maphg=phong
Group by TENPHG
--33. Với mỗi phòng ban, cho biết tên phòng ban, họ tên người trưởng phòng và số lượng đề án mà phòng ban đó chủ trì
Select TENPHG,HONV,TENLOT,TENNV,count(*) as 'Số lượng đề án'
From PHONGBAN,NHANVIEN,DEAN
Where MANV=TRPHG and MAPHG=PHONG
Group by TENPHG,HONV,TENLOT,TENNV
--34. Với mỗi đề án, cho biết tên đề án và số lượng nhân viên tham gia đề án
Select DEAN.MADA,TENDEAN,count(*) as 'Số lượng nhân viên tham gia'
From DEAN,CONGVIEC
Where DEAN.MADA=CONGVIEC.MADA
Group by dean.MADA,TENDEAN