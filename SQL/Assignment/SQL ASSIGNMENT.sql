use tops;
create table company(
	Company_ID int primary key auto_increment,
Company_Name varchar(45),
Street varchar(45),
City varchar(45),
State varchar(45),
ZIP varchar(45));
    
CREATE TABLE Contacts (
Contact_ID INT PRIMARY KEY AUTO_INCREMENT,
Company_ID int not null,
First_Name varchar(45),
last_Name varchar(45),
Street varchar(45),
City varchar(45),
State varchar(45),
ZIP varchar(45),
Is_Main boolean,
Email Varchar(45),
    Phone Varchar(12),
FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID)
);

Create table Employees (
Employee_ID INT PRIMARY KEY AUTO_INCREMENT,
First_Name VARCHAR(50) NOT NULL,
Last_Name VARCHAR(50) NOT NULL,
Salary decimal(10,2),
Hire_Date date,
Job_Title varchar(45),
Email VARCHAR(45),
Phone varchar(12)
);

CREATE TABLE ContactEmployee (
ContactEmployee_ID INT PRIMARY KEY AUTO_INCREMENT,
Contact_ID INT NOT NULL,
Employee_ID INT NOT NULL,
Contact_Date date,
Description varchar(100),
FOREIGN KEY (Contact_ID) REFERENCES Contacts(Contact_ID),
FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
);

update employees
set Phone_number = '215-555-8800'
where First_Name ='Lesley' And Last_Name = 'Bland';

UPDATE Company
SET Company_Name = 'Urban Outfitters'
WHERE Company_Name = 'Urban Outfitters, Inc.';

DELETE FROM ContactEmployee
WHERE ContactEmployee_ID = (
SELECT ContactEmployee_ID
FROM ContactEmployee as CE
JOIN Employees as E1 ON CE.Employee_ID = E1.Employee_ID
JOIN Employees as E2 ON CE.Contact_ID = (
SELECT Contact_ID FROM Contacts WHERE Employee_ID = E2.Employee_ID)
WHERE E1.First_Name = 'Dianne' AND E1.Last_Name = 'Connor' 
AND E2.First_Name = 'Jack' AND E2.Last_Name = 'Lee'
);

SELECT DISTINCT E.First_Name, E.Last_Name
FROM Employees E
JOIN ContactEmployee CE ON E.Employee_ID = CE.Employee_ID
JOIN Contact C ON CE.Contact_ID = C.Contact_ID
JOIN Company Co ON C.Company_ID = Co.Company_ID
WHERE Co.Company_Name = 'Toll Brothers';


-- QUESTION What is the significance of “%” and “_” operators in the LIKE statement? 
-- ANSWER % is used for matching one or more character while _ is used for matching only one chararcter

-- QUESTION Explain normalization in the context of databases.  
-- ANSWER Normalization is the process of organizing a database to reduce redundancy and improve data integrity

-- QUESTION What does a join in MySQL mean?
-- ANSWER It is used for joining rows of one or more table together based on some comman columns in it.

-- QUESTION What do you understand about DDL, DCL, and DML in MySQL?
-- ANSWER DDL stands for data defination language It allows to create, alter or drop tables.
-- 		  DCL stands for data control language It provides access or premission like GRANT or REVOKE.
-- 		  DML stands for data manipulation language It is used to do manipulation inside the table like SELECT, UPDATE, INSERT or DELETE.

-- QUESTION What is the role of the MySQL JOIN clause in a query, and what are some common types of joins?
-- ANSWER The MySQL JOIN clause is used to combine records from two or more tables based on a related column.
-- Common Types of Joins:INNER JOIN: Returns rows with matching values in both tables.
-- LEFT JOIN (OUTER JOIN): Returns all rows from the left table, with matching rows from the right table. Missing matches appear as NULL.
-- RIGHT JOIN (OUTER JOIN): Returns all rows from the right table, with matching rows from the left table.
-- FULL JOIN: Returns rows when there is a match in either table. (Not supported natively in MySQL but can be simulated.)
-- CROSS JOIN: Produces a Cartesian product of two tables. AND SELF JOIN: Joins a table to itself, used for hierarchical data.







  