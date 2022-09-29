if db_id('houseutiltyprovider') is null
create database houseutiltyprovider
go
use houseutiltyprovider
go

---------01------
Create table workareas
(
	workareaid int not null primary key,
	skill nvarchar (40) not null
)
Go
----------02-----
Create table workers
(
	workerid int not null primary key,
	workername nvarchar (40) not null,
	phone nvarchar (20) not null,
	payrate money not null

)
Go
------ table 03---- 
Create table workerareas 
(
	workerid int not null references  workers (workerid),
	areaid int not null references workareas  (workareaid),
	primary key (workerid, areaid )
)
Go
-------- table 04 ------
CREATE table works
(
	workid int not null primary key,
	customename nvarchar (50) not null,
	customeraddress nvarchar (150) not null,
	workareaid int not null references workareas  (workareaid ),
	workdescription nvarchar (100) not null,
	startdate date not null,
	endtime datetime null
)
Go
------ table 05---- 
CREATE table workerpayments
(
	workid int not null references works (workid ),
	workerid int not null references workers (workerid ),
	totalworkhour float null,
	totalpayment money null,
	primary key (workid, workerid )
)
Go

--- insert procedure-----------

CREATE PROC spInsertworkareas
@workareaid INT,
@skill NVARCHAR(30)
AS
BEGIN TRY INSERT INTO 
workareas(workareaid,skill)
VALUES(@workareaid, @skill)
END TRY
BEGIN CATCH
     DECLARE @msg NVARCHAR(1000)
	 SELECT @msg = ERROR_MESSAGE()
	 ;
	 THROW 50001, @msg, 1
END CATCH
GO



---------- table workers 02--------
CREATE PROC spInsertworkers
@workerid INT,
@workername NVARCHAR(30),
@phone nvarchar (20),
@payrate money
AS
BEGIN TRY INSERT INTO 
workers(workerid,workername,phone,payrate)
VALUES(@workerid, @workername,@phone,@payrate)
END TRY
BEGIN CATCH
     DECLARE @msg NVARCHAR(1000)
	 SELECT @msg = ERROR_MESSAGE()
	 ;
	 THROW 50001, @msg, 1
END CATCH
GO
CREATE PROC spUpdateworkareas
			@workareaid INT,
			@skill NVARCHAR(30)
AS
BEGIN TRY update workareas
			
		set	workareaid=@workareaid,
			skill=@skill
			where workareaid=@workareaid
END TRY
BEGIN CATCH
  
	 ;
	 THROW 50002, 'update fail', 1
END CATCH
GO




---------- table workers 02--------
CREATE PROC spUpdateworkers
				@workerid INT,
				@workername NVARCHAR(30),
				@phone nvarchar (20),
				@payrate money
AS
BEGIN TRY update workers
			
		set	workerid=@workerid,
			workername=@workername,
			phone=@phone,
			payrate=@payrate
			where workerid=@workerid
END TRY
BEGIN CATCH
  
	 ;
	 THROW 50002, 'update fail', 1
END CATCH
GO
CREATE PROC spUpdateworks
				@workid INT,
				@customename NVARCHAR(30),
				@customeraddress NVARCHAR(40),
				@workareaid INT,
				@workdescription NVARCHAR(40),
				@startdate DATE,
				@endtime DATETIME
AS
BEGIN TRY update works
			
		set workid=@workid,
			customename=@customename,
			customeraddress=@customeraddress,
			workareaid=@workareaid,
			workdescription=@workdescription,
			startdate=@startdate,
			endtime=@endtime
			where workid=@workid
END TRY
BEGIN CATCH
  
	 ;
	 THROW 50002, 'update fail', 1
END CATCH
GO

CREATE PROC spDeleteworkareas
			@workareaid INT
AS
BEGIN TRY
      DELETE workareas
	  WHERE workareaid = @workareaid
END TRY
BEGIN CATCH
         ;
		 THROW 50001, 'Can not deleted', 1
END CATCH
GO
--------- table workerareas 03------

CREATE PROC spInsertworkerareas
@workerid INT,
@areaid INT
AS
BEGIN TRY INSERT INTO 
workerareas(workerid,areaid)
VALUES(@workerid ,@areaid)
END TRY
BEGIN CATCH
     DECLARE @msg NVARCHAR(1000)
	 SELECT @msg = ERROR_MESSAGE()
	 ;
	 THROW 50001, @msg, 1
END CATCH
GO
CREATE PROC spUpdateworkerareas
				@workerid INT,
				@areaid INT
AS
BEGIN TRY update workerareas
			
		set	workerid=@workerid,
			areaid=@areaid
			where areaid=@areaid
END TRY
BEGIN CATCH
  
	 ;
	 THROW 50002, 'update fail', 1
END CATCH
GO

--------- table works 04------

CREATE PROC spInsertworks
@workid INT,
@customename NVARCHAR(30),
@customeraddress NVARCHAR(40),
@workareaid INT,
@workdescription NVARCHAR(40),
@startdate DATE,
@endtime DATETIME
AS
BEGIN TRY INSERT INTO 
works(workid,customename,customeraddress,workareaid,
workdescription,startdate,endtime)
VALUES(@workid ,@customename,@customeraddress,@workareaid,
@workdescription,@startdate,@endtime)
END TRY
BEGIN CATCH
     DECLARE @msg NVARCHAR(1000)
	 SELECT @msg = ERROR_MESSAGE()
	 ;
	 THROW 50001, @msg, 1
END CATCH
GO



---------- table workerpayments 05--------

CREATE PROC spInsertworkerpayments
@workid INT,
@workerid INT,
@totalworkhour float,
@totalpayment money
AS
BEGIN TRY INSERT INTO 
workerpayments(workid,workerid,totalworkhour,totalpayment)
VALUES(@workid,@workerid,@totalworkhour,@totalpayment)
END TRY
BEGIN CATCH
     DECLARE @msg NVARCHAR(1000)
	 SELECT @msg = ERROR_MESSAGE()
	 ;
	 THROW 50001, @msg, 1
END CATCH
GO
CREATE PROC spDeleteworkers
			@workerid INT
AS
BEGIN TRY
      DELETE workers
	  WHERE workerid = @workerid
END TRY
BEGIN CATCH
         ;
		 THROW 50001, 'Can''t deleted', 1
END CATCH
GO

----- table 3 workerareas ----------

CREATE PROC spDeleteworkerareas
			@workerid INT
AS
BEGIN TRY
      DELETE workerareas
	  WHERE workerid = @workerid
END TRY
BEGIN CATCH
         ;
		 THROW 50001, 'Can not deleted', 1
END CATCH
GO

----- table 4 works ----------

CREATE PROC spDelete @workid int
			
AS
BEGIN TRY
      DELETE works
	  WHERE workid = @workid
END TRY
BEGIN CATCH
         ;
		 THROW 50001, 'Can not deleted', 1
END CATCH
GO
----- table 5 workerpayments ----------

CREATE PROC spDeleteworkerpayments
			@workerid INT
AS
BEGIN TRY
      DELETE workerpayments
	  WHERE workerid = @workerid
END TRY
BEGIN CATCH
         ;
		 THROW 50001, 'Can not deleted', 1
END CATCH
GO


---  join---
create view vdetails
as
select wp.workid,wp.workerid,totalpayment,totalworkhour
,wk.workername,phone,payrate,WA.areaid,wr.workareaid,wr.skill,
w.customename,endtime,startdate,workdescription
from workerpayments as wp
join workers wk on wp.workerid=wk.workerid
join workerareas WA on wk.workerid=WA.workerid
join workareas wr on wa.areaid=wr.workareaid
join works w on wr.workareaid=w.workareaid
go

-------- view ---------- 
CREATE VIEW  workerDetails
AS 
SELECT wp.workerid,workername,phone,payrate
,totalpayment
from workerpayments as wp
join workers wk on wp.workerid=wk.workerid
WHERE workername = 'MD.Abdullah';
go


-------- view 2 -------
CREATE VIEW  worksDetails
AS 
SELECT w.workid,wa.workareaid,customename,customeraddress,
startdate,endtime,skill
from works w
join workareas wa on w.workareaid=wa.workareaid
WHERE workid = '501';

go
--UDF
create function fnWorkerList(@workid int) returns table
as
return
(
	select w.workid, w.customename, w.customeraddress, w.startdate, w.endtime, wk.workername
	from works w
	inner join workerpayments wp on wp.workid = w.workid
	inner join workers wk on wp.workerid = wk.workerid
	where w.workid = @workid
)
go
create trigger trworkdelete
on works
after delete
as
begin
 declare @workid int
 select @workid = workid from inserted
 delete from workerpayments where workerid=@workid
end
go
create trigger trworkerdelete
on workers
after delete
as
begin
 declare @workerid int
 select @workerid = workerid from inserted
 delete from workerpayments where workerid=@workerid
 delete from workerareas where workerid=@workerid
end
go