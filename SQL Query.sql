/*
	VIEWS
   ========
   -> View is a sub-set of a table i.e. part of table.
   -> A View is a virtual table because it doesn't store data and doesn't occupy memory.
   -> It always derives data from BASE table.
   -> A View is a representation of a query.
   -> By using views we will provide the two levels of security for data in a table.
		i) Column level security:
		====================
			- In this level we will hide columns.
		
		ii) Row level security:
		==================
			- In this level we will hide rows.
	

   Purpose of Creating View
   -------------------------
   -> To provide security at row & column level.
   -> To reduce complexity by creating view on complex query.
   
   There are 2 types of View
   --------------------------
   1) Simple View :- A view said to be simple view, if it is created on single table.
   2) Complex View:- A view said to be complex view 
					 - If based on multiple tables
					 - If query contains DISTINCT clause, GROUP BY clause, 
					   AGGREGATE functions, SET operators, Sub-Quaries.

*/

/* 
	Simple View
	===========
	Table Used :- Employee
*/
Select * From Employee

/* Column Level Security */

--Create of View on Employee table on which user can only see Empno,Ename,Job,Hiredate, and Deptno columns
Create View V_Emp AS Select Empno,Ename,Job,Hiredate,Deptno from Employee

--View
Select * from V_Emp


/* Row Level Security */

--Create a view to access employee table Empno,Ename,Job,Deptno column and who are working under deptno is 20?
Create View V_Emp20Dept AS Select Empno,Ename,Job,Deptno From Employee Where Deptno=20

--View
Select * From V_Emp20Dept


/* View using WITH CHECK OPTION */

--create a view to accept and also display Empno,Ename,Job,Deptno whose deptno only 20?
Create View V_Dept20 AS SELECT Empno,Ename,Job,Deptno  From Employee Where Deptno=20 WITH CHECK OPTION

--View
Select * From V_Dept20

--Insert data through view (Error)
Insert into V_Dept20(Empno,Ename,Job,Deptno) values(5555,'Hanuman','Manager',30)

----Insert data through view
Insert into V_Dept20(Empno,Ename,Job,Deptno) values(5555,'Hanuman','Manager',20)


/* 
	Complex Views 
	==============
	Table Used :-  Employee, Dept
*/
Select * From Employee
Select * From Dept

--Create a view on to show Employee No., Name, Job, Department no., Department Name, Department Location.
Create View CV_EmpDept AS SELECT E.EMPNO,E.ENAME,E.JOB,D.DEPTNO,D.DNAME,D.LOC 
FROM Employee as E join Dept as D ON E.DEPTNO=D.DEPTNO

Select * from CV_EmpDept

--Display Department wise Minimum, Maximum, and Total Salary spend on department and No. of employees in particular departments.
Create View CV_EmpSummary AS 
Select Deptno,Min(Sal) as MinSal,Max(Sal) as MaxSal,Sum(Sal) as [Total Salary],Count(*) as [Number of Employees] From Employee
Group By Deptno

Select * From CV_EmpSummary


--Command to see List of VIEW created by user
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='VIEW'

		--OR

SELECT * FROM INFORMATION_SCHEMA.VIEWS

--Command to Delete the View
Drop View V_Emp











