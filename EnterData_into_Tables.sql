-- insert values for XXdb using begin trans and select statement


-- insert values into dbo.Students
BEGIN TRANSACTION;  
      INSERT INTO dbo.Students VALUES(1000,	'Jones',	'Sam',	1);  
      INSERT INTO dbo.Students VALUES(2000,	'Green',	'Chris',23); 
	  INSERT INTO dbo.Students VALUES(3000,	'Smith',	'Alex',	26); 
--commit
--rollback

-- insert values into dbo.Appointments
BEGIN TRANSACTION;  
      INSERT INTO dbo.Appointments VALUES(2000,	'01/01/2020',	100);  
      INSERT INTO dbo.Appointments VALUES(5000,	'27/06/2020',	200); 
	  INSERT INTO dbo.Appointments VALUES(3000,	'31/03/2020',	300); 
--commit
--rollback

-- insert values into dbo.Qualification
BEGIN TRANSACTION;  
      INSERT INTO dbo.Qualification VALUES(211,	1,	'Health & Safety',	5,	'Expired');  
      INSERT INTO dbo.Qualification VALUES(222, 3,'Adult Safeguarding L2', 6, 'Valid'); 
	  INSERT INTO dbo.Qualification VALUES(223, 1, 'Health & Safety', 1, 'Expired'); 
--commit
--rollback

-- insert values into dbo.Course
BEGIN TRANSACTION;  
      INSERT INTO dbo.Course VALUES(1,	24,	'27/11/2019',76215);  
      INSERT INTO dbo.Course VALUES(2,	24,	'06/05/2020',62325); 
	  INSERT INTO dbo.Course VALUES(3,	17,	'16/10/2019',62325); 
--commit
--rollback

17	Adult Safeguarding Advanced Awareness
24	Health & Safety - Introduction
26	Health & Safety Around the Workplace


-- insert values into ref.Course
BEGIN TRANSACTION;  
      INSERT INTO ref.Course VALUES(17,	'Adult Safeguarding Advanced Awareness');  
      INSERT INTO ref.Course VALUES(26,	'Health & Safety Around the Workplace'); 
	  INSERT INTO ref.Course VALUES(24,	'Health & Safety - Introduction'); 
--commit
--rollback


-- insert values into ref.EmployeeTemp using a select statement 
INSERT INTO ref.EmployeeTemp (EmployeeTemp.EmployeeNO) SELECT dbo.Course.EmployeeNo FROM dbo.Course
INNER JOIN ref.Course ON dbo.Course.CourseID = ref.Course.CourseID
WHERE dbo.Course.CourseDate LIKE '%2020' AND ref.Course.CourseName LIKE 'Health & Safety%'


-- insertion through updates
UPDATE dbo.Course SET CourseDate = '27/11/2020' WHERE EmployeeNO = 76215