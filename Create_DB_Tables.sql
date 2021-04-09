-- Create Tables

-- sr1 database
-- create table Patients					
CREATE TABLE dbo.Students (
    PtID INT NOT NULL,
    SurnName VARCHAR(8),
	FirstName VARCHAR(8),
    Age INT NOT NULL,
   CONSTRAINT PK_PtID PRIMARY KEY(PtID)
);


-- create table Appointments
CREATE TABLE dbo.Appointments (
    ApptID INT NOT NULL,
    PtID int NOT NULL,
	AppointmentDate DATE NOT NULL,
   CONSTRAINT PK_ApptID PRIMARY KEY(ApptID)
);


-- create table Qualification
CREATE TABLE dbo.Qualification (
    CompetenceRecNo INT NOT NULL,
    CourseRecNo INT NOT NULL,
	QualificationID INT NOT NULL
	QualificationName VARCHAR(20)
	QualificationStatus VARCHAR(8),
   CONSTRAINT PK_CompetenceRecNo PRIMARY KEY(CompetenceRecNo)
);


-- create table Course
CREATE TABLE dbo.Course (
    CourseRecNo INT NOT NULL,
	CourseID INT NOT NULL,
    CourseDate DATE NOT NULL,
	EmployeeNo INT NOT NULL,
   CONSTRAINT PK_CourseRecNo PRIMARY KEY(CourseRecNo)
);



--src2 database
-- create ref.Course table
CREATE TABLE ref.Course (
    CourseID INT NOT NULL,
	CourseName VARCHAR2(20),
   CONSTRAINT PK_CourseID PRIMARY KEY(CourseID)
);


-- create ref.EmployeeTem table
CREATE TABLE ref.EmployeeTemp(
    EmployeeNO INT NOT NULL,
	EmployeeName VARCHAR2(8),
   CONSTRAINT PK_EmployeeNO PRIMARY KEY(EmployeeNO)
);


