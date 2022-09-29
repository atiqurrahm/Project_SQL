use houseutiltyprovider
Go
EXEC spInsertworkareas 1,'Plumbing'
GO 
EXEC spInsertworkareas 2,'Pipe fitting'
GO
EXEC spInsertworkareas 3,'Electrical work'
Go
EXEC spInsertworkareas 4,'insect control'
GO
EXEC spInsertworkareas 5,'General labor'
GO
SELECT * FROM workareas
GO
--- table 2 ---
EXEC spInsertworkers 101,'MD.Mahidol','01620151533',900.00
GO 
EXEC spInsertworkers 102,'Raisul islam','01829415557',850.00
GO
EXEC spInsertworkers 103,'Sakib khan','01811695986',700.00
GO
EXEC spInsertworkers 104,'MD.Abdullah','01687032087',650.00
GO
EXEC spInsertworkers 105,'Tuhin sarker','01742405277',950.00
GO
EXEC spInsertworkers 106,'Sifat hasan','01708355205',700.00
GO
EXEC spInsertworkers 107,'MD.Akash','01571282593',600.00
GO
Select* from workers

---- table 03----
EXEC spInsertworkerareas 101,1
GO 
EXEC spInsertworkerareas 101,2
GO 
EXEC spInsertworkerareas 102,3
GO 
EXEC spInsertworkerareas 103,4
GO 
EXEC spInsertworkerareas 103,5
GO 
EXEC spInsertworkerareas 104,4
GO 
EXEC spInsertworkerareas 105,3
GO 
EXEC spInsertworkerareas 106,2
GO 
EXEC spInsertworkerareas 107,1
GO 
EXEC spInsertworkerareas 105,5
GO 
Select* from workerareas

--- table 04--- 

EXEC spInsertworks 501,'MD.Jony','12, Gulshan-1',1,
'Swage pipe replacement ','2020-01-01','2020-8-04'
GO 
EXEC spInsertworks 502,'MD.Jowel','15, Bonani-3',2,
'Garage electric wiring ','2020-01-06','2020-5-04'
GO 
EXEC spInsertworks 503,'MD.shajib','44,Dhanmondi-1',3,
'House cleaning ','2020-02-05','2020-9-04'
GO 
EXEC spInsertworks 504,'MD.Faruk','33,Rajarbag-4',4,
'Garden water line replace ','2020-03-01','2020-7-04'
GO 
EXEC spInsertworks 505,'MD.shahin','15, Arambag-4',5,
'New Electic line','2020-04-01','2020-06-04'
GO 
select* from works
Go
select* from workerDetails
-------- table 05 -

EXEC spInsertworkerpayments 
501, 101, DATEDIFF (HOUR, '2020-01-01','2020-08-04'),
DATEDIFF (HOUR, '2020-01-01','2020-08-04')*900
GO 
SELECT * from vdetails
go
select * from workerDetails
go
select * from worksDetails
go
select * from fnWorkerList(1)
go
