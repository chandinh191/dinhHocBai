-- CREATE DATABASE AND TABLE
--create database CongTyABC
--use CongTyABC
DROP TABLE KiemSoat
DROP TABLE DuAn
DROP TABLE SoThich
DROP TABLE NhanVien
DROP TABLE DiaDiemDV
DROP TABLE DonVi
create table DonVi
(
	MaSoDV int primary key,
	TenDonVi nvarchar(50)
)
create table DiaDiemDV
(
	MaSoDV int ,
	DiaDiemDonVi nvarchar(200),
	foreign key (MaSoDV) references  DonVi(MaSoDV)
)
create table NhanVien
(
	MaSoNV int primary key,
	HoDem nvarchar(100),
	Ten nvarchar(100),
	NgaySinh date,
	GioiTinh varchar(10) CHECK(GioiTinh='Male' or GioiTinh='Female'),
	Luong int,
	DiaChi nvarchar (200),
	MaSoDV int,
	NgayBatDau date,
	foreign key (MaSoDV) references  DonVi(MaSoDV)
)
create table SoThich
(
	MaSoNV int,
	foreign key (MaSoNV) references  NhanVien(MaSoNV),
	SoThich nvarchar(100)
)
create table DuAn
(
	MaSoDA int primary key,
	DiaDiemDuAn nvarchar(200),
	TenDuAn nvarchar(50),
	MaSoNV int,
	SoGio int CHECK (SoGio>=0)
	foreign key (MaSoNV) references  NhanVien(MaSoNV),
)
create table KiemSoat
(
	MaSoDV int,
	MaSoDA int,
	foreign key (MaSoDV) references  DonVi(MaSoDV),
	foreign key (MaSoDA) references  DuAn(MaSoDA),
	primary key(MaSoDV,MaSoDA)
)

-- INSERT INFOMATION
insert into DonVi values (1, 'Mien Nam')
insert into DonVi values (2, 'Mien Trung')
insert into DonVi values (3, 'Mien Bac')
insert into DonVi values (4, 'Mien Tay')
insert into DonVi values (5, 'Mien Dong')

insert into DiaDiemDV values(1, N'số 02, đường Bla Bla, phường 1,...')
insert into DiaDiemDV values(1, N'số 56, đường XYZ, phường 6,...')
insert into DiaDiemDV values(2, N'số 312, đường QL1A, Bình Chánh,...')
insert into DiaDiemDV values(4, N'số 234, đường Lý Thường Kiệt, phường An Hòa,...')
insert into DiaDiemDV values(5, N'số 161810, đường Nguyễn Xiển, Quận 9,...')

insert into NhanVien values(1,N'Trần Công',N'Vinh','2000-01-13','Male',100000,N'Đồng Tháp',4,null)
insert into NhanVien values(2,N'Phạm Phú Ngọc',N'Trai','2002-07-22','Male',4500000,N'Vĩnh Long',5,'2020-11-11')
insert into NhanVien values(3,N'ABC',N'XYZ','2001-04-21','Female',2000,N'TP HCM',1,null)
insert into NhanVien values(4,N'Bla bla',N'Tùng','1999-09-15','Male',990000,N'Vũng Tàu',2,'2021-01-17')
insert into NhanVien values(5,N'Nguyễn Thị',N'Bành','2002-12-05','Female',8888888,N'Quận nine',3,null)

insert into SoThich values(1,N'Đá bóng')
insert into SoThich values(1,N'Bơi lội')
insert into SoThich values(2,N'Coding')
insert into SoThich values(3,N'Ngủ')
insert into SoThich values(4,N'Chơi game')
insert into SoThich values(5,N'Ca hát')

insert into DuAn values(1,N'Cần Thơ',N'Project A',3,12)
insert into DuAn values(2,N'Hà Nội',N'Project B',4,34)
insert into DuAn values(3,N'Tp HCM',N'Project C',5,5)
insert into DuAn values(4,N'Đà Đẵng',N'Project D',1,7)
insert into DuAn values(5,N'Quy Nhơn',N'Project E',2,11)

insert into KiemSoat values(1,2)
insert into KiemSoat values(2,3)
insert into KiemSoat values(3,5)
insert into KiemSoat values(4,2)
insert into KiemSoat values(5,2)

-- TRUY VẤN
--In ra các nhân viên
select * from NhanVien