--CÂU 1
CREATE DATABASE QLDIEM
CREATE TABLE MonHoc(
	MaMon VARCHAR(4) PRIMARY KEY,
	TenMon NVARCHAR(30),
	SoTC INT
	)

CREATE TABLE SinhVien(
	MaSV VARCHAR(4) PRIMARY KEY,
	HoTen NVARCHAR(30),
	NgaySinh DATETIME
	)

CREATE TABLE Diem(
	MaSV VARCHAR(4),
	MaMon VARCHAR(4),
	DiemThi FLOAT,
	CONSTRAINT FK_MaSV FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV),
	CONSTRAINT FK_MaMon FOREIGN KEY (MaMon) REFERENCES MonHoc(MaMon),
	CONSTRAINT PK_MaSV_MaMon PRIMARY KEY(MaSV,MaMon)
	)
GO
--Nhập dữ liệu
INSERT MonHoc VALUES
('01',N'TOÁN',3),
('02',N'HÓA',2),
('03',N'NGOẠI NGỮ',3)
GO

INSERT SinhVien VALUES
('SV01',N'NGUYỄN HOÀNG MINH TUẤN',04/03/1990),
('SV02',N'TRẦN THANH LÂM',05/12/1992),
('SV03',N'TRẦN THỊ BÍCH TRÂM',11/10/1992)
GO

INSERT Diem VALUES
('SV01','01',4),
('SV01','02',10),
('SV01','03',6),
('SV03','02',7),
('SV02','01',5)
GO

Select * from Diem
Select * from SinhVien
Select * from MonHoc

--CÂU 2
GO
create function thongke (@tmh nvarchar(20))
returns int
as
begin
 declare @dem int
 set @dem = (select count(@tmh) from Diem join MonHoc on MonHoc.MaMON = Diem.MaMON where Diem.DiemThi<5)
 return @dem
end
GO
select dbo.thongke('TOÁN')
--CÂU 3
go
create procedure nhapDiem(@MaSV char(5),@MaMon char(5), @DiemThi float)
as
insert into Diem(MaSV,MaMH,Diemthi) values(@MaSV,@MaMon,@DiemThi)
go
nhapDiem '01','TOÁN',4
go
--CÂU 4
create trigger them_sua
on Diem
FOR  INSERT, UPDATE
AS
if(select DiemThi From inserted)>10 and (select DiemThi From inserted)<0
begin
print
'khong cho phep'
rollback transaction
end
insert into Diem
values ('SV1','TOÁN','4')


