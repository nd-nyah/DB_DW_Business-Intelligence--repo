-- get data from tables and also with new headings

-- retrieve data from two tables
SELECT * FROM dbo.Students LEFT JOIN dbo.Appointments ON Students.PtID = Appointments.PtID				
SELECT * FROM dbo.Students INNER JOIN dbo.Appointments ON Students.PtID = Appointments.PtID				
SELECT * FROM dbo.Students CROSS JOIN dbo.Appointments				
SELECT * FROM dbo.Students RIGHT JOIN dbo.Appointments ON Students.PtID = Appointments.PtID	


-- select information by group
SELECT PtID, MAX (AppointmentDate) 
FROM dbo.Appointments GROUP BY PtID	


-- select categories information
SELECT PtID, Surname, FirstName, Age,
    CASE   
         WHEN Age <18 THEN 'Under 18'
         WHEN Age <=65  THEN '18 to 65'
         ELSE 'Over 65'
    END AS AgeGroup 
FROM dbo.Patients	


-- selection by condition with Alias
SELECT COUNT(dbo.Qualification.QualificationName) AS ValidHealthSafetyQualifications FROM dbo.Qualification
inner join dbo.Course ON dbo.Qualification.CourseRecNo = dbo.Course.CourseRecNo
WHERE dbo.Qualification.QualificationName = 'Health & Safety' AND dbo.Qualification.QualificationStatus = 'valid'					
						
					
-- selection and aggregation with count
SELECT COUNT(EmployeeNo) AS TotalEmployee201910To202006 FROM dbo.Course WHERE CourseDate BETWEEN '16/10/2019' AND '06/05/2020'						

												
						
-- get data from other servers
USE master;
GO
SELECT * FROM [sr1\SQLEXPRESS].[AdventureWorks2012].[HumanResources].[Intern] as t1
INNER JOIN [sr2\AGRDEMO553].[agrdemo].[HumanResources].[Appointment] as t2 ON t2.PtID = t1.PtID

						
						
					
						
						
						
						
						

						
						
						
						

					