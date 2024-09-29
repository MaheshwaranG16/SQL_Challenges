CREATE TABLE Salary
	(emp_id int,
    emp_name varchar(20),
    base_salary int,
    PRIMARY KEY(emp_id));
    
CREATE TABLE Income
	(id int,
    income varchar(20),
    percent int,
    PRIMARY KEY(id));
    
CREATE TABLE Deduction
	(id int,
    deduction varchar(20),
    percent int,
    PRIMARY KEY(id));
    
INSERT INTO Salary(emp_id,emp_name,base_salary)
	VALUES
		(1,"Rohan",5000),
        (2,"Alex",6000),
        (3,"Maryam",7000);
        
INSERT INTO Income(id,income,percent)
	VALUES
		(1,"Basic",100),
        (2,"Allowance",4),
        (3,"Others",6);
        
INSERT INTO Deduction(id,deduction,percent)
	VALUES
		(1,"Insurance",5),
        (2,"Health",6),
        (3,"House",4);