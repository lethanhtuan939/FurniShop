CREATE DATABASE FurniData
GO
USE FurniData
GO

CREATE TABLE Account (
	username varchar(30) primary key,
	password varchar(50) not null,
	isAdmin bit,
	isSell bit
)

CREATE TABLE Product(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[sell_ID] [int] NULL
)

SELECT * FROM Account
SELECT * FROM Product

INSERT INTO Product ([name], [image], price, sell_ID)
VALUES (N'Đôn Banana', 'https://o.remove.bg/downloads/9218bd39-2bde-4d9a-909a-32bfabc02021/015214221111_No8_Puff_1024x680White_V2-803x430-Copy-2-300x300-removebg-preview.png', 2100000, 1)

UPDATE Product
SET [image] = 'https://scontent.xx.fbcdn.net/v/t1.15752-9/330596959_844814699920238_1648247078837424015_n.png?stp=dst-png_p206x206&_nc_cat=106&ccb=1-7&_nc_sid=aee45a&_nc_ohc=Xpc0ciKfXH0AX-rngWn&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AdRIepGILboNVKFZyF5uT6hmAbTdUkU25pcLHg1g64XAtA&oe=6411C84E'
WHERE id = 12

Select * from Product where [name] like N'%Ghê%'