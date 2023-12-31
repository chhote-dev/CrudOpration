USE [master]
GO
/****** Object:  Database [Companytask]    Script Date: 9/27/2023 11:32:50 AM ******/
CREATE DATABASE [Companytask]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Companytask', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Companytask.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Companytask_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Companytask_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Companytask] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Companytask].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Companytask] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Companytask] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Companytask] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Companytask] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Companytask] SET ARITHABORT OFF 
GO
ALTER DATABASE [Companytask] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Companytask] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Companytask] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Companytask] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Companytask] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Companytask] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Companytask] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Companytask] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Companytask] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Companytask] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Companytask] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Companytask] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Companytask] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Companytask] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Companytask] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Companytask] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Companytask] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Companytask] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Companytask] SET  MULTI_USER 
GO
ALTER DATABASE [Companytask] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Companytask] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Companytask] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Companytask] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Companytask] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Companytask] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Companytask] SET QUERY_STORE = OFF
GO
USE [Companytask]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 9/27/2023 11:32:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Deptid] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[Deptid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/27/2023 11:32:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Empid] [int] IDENTITY(1,1) NOT NULL,
	[Empname] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Salary] [int] NULL,
	[Deptid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Empid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Deptid], [DeptName]) VALUES (1, N'IT2')
INSERT [dbo].[Department] ([Deptid], [DeptName]) VALUES (4, N'CSE engingneering')
INSERT [dbo].[Department] ([Deptid], [DeptName]) VALUES (7, N'Hr Department')
INSERT [dbo].[Department] ([Deptid], [DeptName]) VALUES (8, N'Computer Science And Engineering')
INSERT [dbo].[Department] ([Deptid], [DeptName]) VALUES (9, N'WEB Designing ')
INSERT [dbo].[Department] ([Deptid], [DeptName]) VALUES (10, N'IT department2')
INSERT [dbo].[Department] ([Deptid], [DeptName]) VALUES (12, N'Civil Department3')
INSERT [dbo].[Department] ([Deptid], [DeptName]) VALUES (17, N'IT')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Empid], [Empname], [City], [Salary], [Deptid]) VALUES (8, N'Abhishek 1', N'Mirzapur', 3450, 1)
INSERT [dbo].[Employee] ([Empid], [Empname], [City], [Salary], [Deptid]) VALUES (9, N'Vishal', N'Jaunpur', 10000, 7)
INSERT [dbo].[Employee] ([Empid], [Empname], [City], [Salary], [Deptid]) VALUES (11, N'Ajit Yadav', N'Gazipur', 20000, 4)
INSERT [dbo].[Employee] ([Empid], [Empname], [City], [Salary], [Deptid]) VALUES (12, N'Anil kumar', N'Delhi', 20000, 1)
INSERT [dbo].[Employee] ([Empid], [Empname], [City], [Salary], [Deptid]) VALUES (13, N'Rahul', N'Varanshi', 20000, 7)
INSERT [dbo].[Employee] ([Empid], [Empname], [City], [Salary], [Deptid]) VALUES (15, N'Name', N'Mirzapur', 150000, 7)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([Deptid])
REFERENCES [dbo].[Department] ([Deptid])
GO
/****** Object:  StoredProcedure [dbo].[sp_department]    Script Date: 9/27/2023 11:32:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_department]
@Deptid int=0,
@DeptName varchar(60)=null,
@action int=0 
as
begin
if @action=1
begin
insert into Department(DeptName) values(@DeptName)
end
if @action=2
begin
select * from Department 
end
if @action=3
begin
update Department set DeptName=@DeptName where Deptid=@Deptid
select 'Department Data update Successfully' as msg
end
if @action=4
begin
delete from Department where Deptid=@Deptid
select 'Department Data delete Successfully' as msg

end

if @action=5
begin
select * from Department where Deptid=@Deptid 
end

end
GO
/****** Object:  StoredProcedure [dbo].[sp_employee]    Script Date: 9/27/2023 11:32:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_employee]
@Empid int=0,
@Empname varchar(50)=null,
@City varchar(50)=null,
@Salary int=0 ,
@Deptid int =0,
@action int =0
as
begin
if @action=1
begin
insert into Employee(Empname,City,Salary,Deptid)values(@Empname,@City,@Salary,@Deptid)
end
if @action=2
begin
update Employee set Empname=@Empname,City=@City,Salary=@Salary,Deptid=@Deptid where Empid=@Empid;
select 'Employee data update successfully' as msg
end
if @action=3
begin
delete from Employee where Empid=@Empid
select 'Employee data delete successfully' as msg

end
if @action=4
begin
select Employee.Empid, Department.DeptName,Employee.Empname,Employee.City,Employee.Salary from Employee left join Department on Employee.Deptid=Department.Deptid;
end
if @action=5
begin
select * from Employee where Empid=@Empid
end

end
GO
USE [master]
GO
ALTER DATABASE [Companytask] SET  READ_WRITE 
GO
