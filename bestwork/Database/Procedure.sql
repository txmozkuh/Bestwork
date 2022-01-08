--Xem danh sách các job có trong website
create or alter procedure View_all_Job
as
select Rj.Job_Name,rj.Salary,rj.Recruitment_Quantity,rj.District,rj.End_Date,rj.Remote,r.Recruiter_Name
from Recruiter_Job  RJ join Recruiter  R on (Rj.Recruiter_ID=r.Recruiter_ID)
go
-- Xem cụ thể 1 Job
create or alter procedure View_Detail_Job
as
select * from Job

go

--Đăng kí tài khoản 
create or alter procedure CreateAccount
@email varchar(50),
@password char(100)
as 
insert into Account(Email,Password) values (@email,@password)

select * from Candidate
go
--Tạo tài khoản candidate
create or alter procedure CreateCandidate
@Candidate_Name nvarchar(50),
@Date_Of_Birth date,
@Gender bit,
@Phone_Number char(10),
@Email varchar(50),
@About nvarchar(200),
@Apply_Position int,
@Working_Form  nvarchar(50),
@Created_Date datetime,
@Account_ID int
as
if not exists (select * from candidate where Account_ID=@account_ID)
begin
insert into Candidate(Candidate_Name,Date_Of_Birth,Gender,Phone_Number,Email,About,Apply_Position,Public_CV,Working_Form,Created_Date,Account_ID)
values (@Candidate_Name,@Date_Of_Birth,@Gender,@Phone_Number,@Email,@About,@Apply_Position,0,@Working_Form,Getdate(),@Account_ID)
Update Account set User_Type ='Candidate'
end
go

--Tạo tài khoản recruiter
create or alter procedure CreateRecruiter
@Recruiter_Name nvarchar(50),
@District nvarchar(50),
@City nvarchar(50),
@Tax char(10),
@Email nchar(50),
@Account_ID int
as
if not exists (select * from candidate where Account_ID=@account_ID)
begin
insert into Recruiter(Recruiter_Name,District,City,Tax,Email,Created_Date,status,Account_ID)
values (@Recruiter_Name,@District,@City,@Tax,@Email,Getdate(),0,@Account_ID)
Update Account set User_Type ='Recruiter'
end

go
---Tạo tài khoản Admin
Create or alter procedure CreateAdminAccount
@Admin_Name nvarchar(50),
@Date_Of_Birth date,
@Gender bit,
@Phone_Number char(10),
@Email varchar(50),
@Account_ID int
as
if not exists (select * from candidate where Account_ID=@account_ID)
begin
insert into Admin(Admin_Name,Date_Of_Birth,Gender,Phone_Number,Email,Created_Date,Account_ID)
values (@Admin_Name,@Date_Of_Birth,@Gender,@Phone_Number,@Email,Getdate(),@Account_ID)
Update Account set User_Type ='Admin'
end
go


--Tạo 1 job mới

go

create or alter procedure CreateJob
@Job_Name nvarchar(50),
@Salary int,
@Start_Date date,
@End_Date date,
@District nvarchar(50),
@City nvarchar(50),
@Working_form nvarchar(50),
@Recruiment_Quantity int,
@Status nvarchar(50),
@Remote bit,
@Years_Of_Expenrience int,
@Type_ID int,
@Recruiter_ID int
as
begin
insert into Recruiter_Job(Job_Name,Salary,Start_Date,End_Date,District,City,Working_form,Recruitment_Quantity,Status,Remote,Years_Of_Experience,Type_ID,Recruiter_ID)
values (@Job_Name,@Salary ,@Start_Date,@End_Date,@District,@City,@Working_form,@Recruiment_Quantity,@Status,@Remote,@Years_Of_Expenrience,@Type_ID,@Recruiter_ID)
end
go

--Tìm Job theo tên
create or alter procedure FindJobByName
@JobName nvarchar(50)
as
if @JobName is not null
begin
select Rj.Job_Name,rj.Salary,rj.Recruitment_Quantity,rj.District,rj.End_Date,rj.Remote,r.Recruiter_Name
from Recruiter_Job  RJ join Recruiter  R on (Rj.Recruiter_ID=r.Recruiter_ID)
where rj.Job_Name like '%' +@JobName+'%'
end
go

--Tìm Job theo mức lương
create or alter procedure FindJobBySalary
@Min int,
@Max int
as
if @Min is  null
begin
select Rj.Job_Name,rj.Salary,rj.Recruitment_Quantity,rj.District,rj.End_Date,rj.Remote,r.Recruiter_Name
from Recruiter_Job  RJ join Recruiter  R on (Rj.Recruiter_ID=r.Recruiter_ID)
where rj.Salary<@Max
end
else if @Max is null
begin
select Rj.Job_Name,rj.Salary,rj.Recruitment_Quantity,rj.District,rj.End_Date,rj.Remote,r.Recruiter_Name
from Recruiter_Job  RJ join Recruiter  R on (Rj.Recruiter_ID=r.Recruiter_ID)
where rj.Salary>@Min
end
else 
begin
select Rj.Job_Name,rj.Salary,rj.Recruitment_Quantity,rj.District,rj.End_Date,rj.Remote,r.Recruiter_Name
from Recruiter_Job  RJ join Recruiter  R on (Rj.Recruiter_ID=r.Recruiter_ID)
where rj.Salary between @Min and @Max
end
go

--Lấy ra danh sách candidate apply vào 1 job cụ thể
create or alter procedure List_All_Candidate_Apply_Job
@Recruiter_Job_ID int
as
select * from Candidate C
where C.Candidate_ID in (select Candidate_ID from Application  where Recruiter_Job_ID=@Recruiter_Job_ID)

--Lấy ra danh sách các công việc của 1 công ty theo tên
go

create or alter procedure View_Job_Of_A_Recruiter
@Recruiter_Name nvarchar(50)
as
select * 
from Recruiter_Job rj join Recruiter r on( rj.Recruiter_ID=r.Recruiter_ID)
where  r.Recruiter_Name like '%' + Recruiter_Name +'%'
go

--Xem thông tin 1 recruiter
create or alter procedure View_Recruiter_Info
@Recruiter_ID int
as
select * from Recruiter where @Recruiter_ID=@Recruiter_ID
go

--Lấy ra các job đã apply
create or alter procedure View_Job_Applied
@Candidate_ID int
as
select * from Recruiter_Job   rj join Application app on (rj.Recruiter_Job_ID=app.Recruiter_Job_ID)
where app.Candidate_ID=@Candidate_ID
go

--lấy ra thông tin mô tả job
create or alter procedure Get_Job_Description
@Recruiter_Job_ID int
as
select *
from Description where Recruiter_Job_ID=@Recruiter_Job_ID
order by Recruiter_Job_ID,Ordinal_Number asc
