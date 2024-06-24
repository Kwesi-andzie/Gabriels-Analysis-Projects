---Create Clinic_DB;
CREATE Database Clinic_DB;

---Patient ---Patient_id, name, DOB, Address, SSN, Phone, Gender
---Physician ---physician_id, name, dob, speciality, address, ssn, phone number, Gender
---Diagnosis ---diag_id,diag_type
---Episode_of_Care---Epi_Id, Date_time_of_epi, Duration_epi, Attn_phys_id, Pat_Id
---Claims---Clm_id, Pat_id,Charge_amount, Copay_Amount, Clm_date, Clm_type

USE Clinic_DB;
---Creating Patient table;
CREATE table Patient 
(Pat_ID NCHAR(4) NOT NULL ,
Name NVARCHAR (60) NOT NULL,
DOB Date NOT NULL,
Address NVARCHAR(100) NOT NULL,
SSN NCHAR(9) NOT NULL,
Phone NCHAR(12) NULL,
Gender CHAR(1) NOT NULL
);

INSERT INTO Patient(Pat_ID,Name,DOB,address,SSN,phone,gender)
VALUES('PT10','Jessica Nori','2000-12-10','5347 Taney Street','7689084408','202-346-4456','Female'),
      ('PT15','Theo Jackson','1998-08-10','6609 Amber Ave','111013331','212-987-9989','Male'),
	  ('PT21','Jamal Jordan','1997-09-10','990 Fox Street','987654321','345-776-7678','Male'),
	  ('PT34','Maxwell Melaz','1968-07-01','5345 Vacaz Ave','987123456','929-998-9559','Male'),
	  ('PT39','Ember Crawley','1988-03-15','2045 Somah Street','22345778','757-404-4564','Female');

SELECT Pat_ID
FROM Patient
WHERE Pat_ID = 'PT15'

UPDATE Patient
SET NAME = 'Theodore Jackson'
WHERE Pat_ID = 'PT15'


---Modify Table to add primary key constraints;
ALTER table Patient
ADD Constraint PK_Patient_Pat_ID PRIMARY KEY(Pat_ID);

---Create Physician Table;
---phys_id, name, dob, speciality, address, ssn, phone number, Gender;


CREATE table Physician 
(Phys_ID NCHAR(4) NOT NULL,
NAME NVARCHAR(60) NOT NULL,
DOB DATE NOT NULL,
SPECIALITY NVARCHAR(30) NOT NULL,
ADDRESS NVARCHAR(100) NOT NULL,
SSN NCHAR(9) NOT NULL,
Phone NCHAR(12) NULL,
Gender CHAR(1) NOT NULL
);

INSERT INTO Physician(Phys_ID,Name,DOB,SPECIALITY,address,SSN,phone,gender)
VALUES('PY01','Paul Mason','1970-11-10','Nuerologist','123 Nuero Street','123456789','443-344-1234','Male'),
      ('PY04','Samantha Johnson','1984-08-10','Cardiologist','244 Cardio Street','123456789','565-443-1234','Female'),
	  ('PY05','Jonathan Jones','1991-10-10','Hematologist','335 Hemato Street','987654321','202-567-4487','Male'),
	  ('PY09','Martin Lewis','1978-12-01','Dermatologist','4789 Jones Street','987123456','443-367-7797','Male'),
	  ('PY12','Emily Clemens','1988-03-15','Psychiatrist','6549 Matrix Street','22345778','757-987-9989','Female')



 ---Modify Table to add primary key constraints;
ALTER table Physician
ADD Constraint PK_Physician_Phys_ID PRIMARY KEY(Phys_ID);

---Diagnosis ---diag_id,diag_type,date_of_diag,Phys_ID
CREATE table Diagnosis
(Diag_Id NCHAR(4) NOT NULL,
diag_type NVARCHAR(60) NOT NULL,
date_of_diag DATE NOT NULL,
Phys_ID NCHAR(4) NOT NULL
);

INSERT INTO Diagnosis(diag_id,diag_type,date_of_diag,phys_id)
VALUES('DI121','Headache','2020-11-10','PY01'),
      ('DI122','Heart Palpitations','2019-08-10','PY04'),
	  ('DT123','Skin Rash','2020-10-15','PY09'),  
	  ('DT124','Depression','2018-09-02','PY12'),
	  ('DT125','Sickle Cell','2019-01-02','PY05');



---Episode_of_Care---Epi_Id, Date_time_of_epi, Duration_epi, Attn_phys_id, Pat_Id
CREATE TABLE Episode_of_Care
(Epi_Id NCHAR(4) NOT NULL,
Date_Time_of_Epi DATETIME,
Duration_Epi TIME NOT NULL,
Attn_phys_id NCHAR(4) NOT NULL,
Pat_id NCHAR(4) NOT NULL
)
INSERT INTO Episode_of_Care(Epi_Id,Date_Time_of_Epi,Duration_epi,Attn_phys_id,Pat_id)
VALUES('EC45','2023-06-07 14:30:00','01:45:00','PY04','PT15'),
	  ('EC25','2023-08-10 12:30:00','00:45:00','PY01','PT10'),
	  ('EC15','2023-10-09 13:45:00','01:00:00','PY09','PT39'),
	  ('EC24','2022-09-05 15:30:00','00:30:00','PY12','PT34'),
	  ('EC32','2021-04-08 16:45:00','02:00:00','PY05','PT21');




---Claims---Clm_id, Pat_id,Charge_amount, Copay_Amount, Clm_date, Clm_type
CREATE TABLE Claims
(Clm_Id NCHAR(4) NOT NULL,
Pat_ID NCHAR(4) NOT NULL,
Charge_amount INT NOT NULL,
Copay_amount INT NOT NULL,
Clm_date DATE NOT NULL,
Clm_type NVARCHAR(25) NOT NULL
)

INSERT INTO Claims(Clm_Id,Pat_ID,Charge_amount,Copay_amount,Clm_date,Clm_type)
VALUES('CL12','PT10','1000','25','2023-10-10','Inpatient Claim'),
	  ('CL05','PT15','523','50','2023-08-07','Inpatient Claim'),
	  ('CL25','PT39','750','75','2023-12-09','Inpatient Claim'),
	  ('CL10','PT34','505','50','2022-11-05','Inpatient Claim'),
	  ('CL44','PT21','989','98','2021-06-08','Inpatient Claim');




---Modify Table to add primary key constraints;
ALTER table Diagnosis
ADD Constraint PK_Diagnosis_Diag_ID PRIMARY KEY(Diag_ID);


---Modify Table to add foreign key constraints;
ALTER table Diagnosis
ADD Constraint FK_Diagnosis_Phys_ID FOREIGN KEY(Phys_ID)
REFERENCES Physician(Phys_ID);

---modify table to add check constraint
ALTER table physician
ADD Constraint CHK_physician_ssn check(len(ssn) = 9);

ALTER table physician
ADD Constraint CHK_physician_ssn check(age >= 18);


---modify table to add default constraint
ALTER table physician 
ADD Constraint DF_Physician_phone  DEFAULT 'unknown' FOR Phone;
---delete constraint
Alter table physician
DROP Constraint DF_Physician_Phone

---Clustered index 
---nonclustered index 

CREATE CLUSTERED INDEX indx_diag_type ON Diagnosis(Diag_type);

---delete entire record from a table
TRUNCATE TABLE Diagnosis;

---how to increase the size of a table
---modify data_type and width of a column of a table

ALTER table diagnosis
ALTER column diag_type VARCHAR(50) NOT NULL;

---renaming table
 EXECUTE  sp_rename 'patient','patients';

 ---renaming column
 EXECUTE sp_rename 'patient.name','pname','column';

 ---inserting record/populating a table;




	  
Select * From Diagnosis
Select * From Physician 




---update 



CREATE table Patient1 
(Pat_ID INT IDENTITY(1000,1) NOT NULL ,
Name NVARCHAR (60) NOT NULL,
DOB Date NOT NULL,
Address NVARCHAR(100) NOT NULL,
SSN NCHAR(9) NOT NULL,
Phone NCHAR(12) NULL,
Gender CHAR(1) NOT NULL
);


CREATE table Surgeon  
(Surgeon_ID INT IDENTITY(1000,1) NOT NULL,
NAME NVARCHAR(60) NOT NULL,
DOB DATE NOT NULL,
SPECIALITY NVARCHAR(30) NOT NULL,
ADDRESS NVARCHAR(100) NOT NULL,
SSN NCHAR(9) NOT NULL,
Phone NCHAR(12) NULL,
Gender CHAR(1) NOT NULL
);

INSERT INTO Surgeon(Surgeon_ID,Name,DOB,SPECIALITY,address,SSN,phone,gender)
VALUES( 'SG01','Mike Mondae','1971-11-10','nuerologist','123 nuero street','123456789','443-344-1234','male'),
       ('SG04','Sam John','1974-09-20', 'cardiologist','244 cardio street','123456789','565-443-1234','female');

	   SELECT * FROM Surgeon
----update

---DML COMMNANDS
---INSERT,UPDATE,DELETE,LOCK,CALL
UPDATE Surgeon
SET NAME = 'PAUL JOHNSON' 
WHERE Surgeon_ID = 'SG01'

UPDATE Surgeon
SET SPECIALITY = 'Plastic Surgeon' 
WHERE Surgeon_ID = 'SG01'




---SELECT ---retrieve the data ---list of column names,derived column names (aggregate or non-aggregate
---FROM ---specifies the table in which the data resides 
---WHERE---Filter or do comparison on the original column or the derived non-aggregate columns
---GROUP BY---used to group the original column, derived non aggregate columns in the select lists whenever there is/are derived aggregate columns in the selects lists
---HAVING ---filter or do comparison on the derived aggregate columns
---ORDER BY ---Sorts the retrieved data in ascending or descending order (default is ASC)



----AGGREGATE FUNCTIONS 
--SUM()
--AVG()
---COUNT()
--MAX()
--MIN()



--F(1) = 2*1 + 1 = 3


