% EMPLOYEE(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
employee("John","B","Smith","123456789","1965-01-09","731 Fondren,Houston,TX","M","30000","333445555","5").
employee("Franklin","T","Wong","333445555","1955-12-08","638 Voss,Houston,TX","M","40000","888665555","5").
employee("Alicia","J","Zelaya","999887777","1968-01-19","3321 Castle,Spring,TX","F","25000","987654321","4").
employee("Jennifer","S","Wallace","987654321","1941-06-20","291 Berry,Bellaire,TX","F","43000","888665555","4").
employee("Ramesh","K","Narayan","666884444","1962-09-15","975 Fire Oak,Humble,TX","M","38000","333445555","5").
employee("Joyce","A","English","453453453","1972-07-31","5631 Rice,Houston,TX","F","25000","333445555","5").
employee("Ahmad","V","Jabbar","987987987","1969-03-29","980 Dallas,Houston,TX","M","25000","987654321","4").
employee("James","E","Borg","888665555","1937-11-10","450 Stone,Houston,TX","M","55000","","1").

% DEPARTMENT(Dname, Dnumber, Mgr_ssn, Mgr_start_date)
department("Research","5","333445555","1988-05-22").
department("Administration","4","987654321","1995-01-01").
department("Headquarters","1","888665555","1981-06-19").

% DEPT_LOCATION(Dnumber, Dlocation)
dept_location("1","Houston").
dept_location("4","Stafford").
dept_location("5","Bellaire").
dept_location("5","Sugarland").
dept_location("5","Houston").

% PROJECT(Pname, Pnumber, Plocation, Dnum)
project("ProductX","1","Bellaire","5").
project("ProductY","2","Sugarland","5").
project("ProductZ","3","Houston","5").
project("Computerization","10","Stafford","4").
project("Reorganization","20","Houston","1").
project("Newbenefits","30","Stafford","4").


% WORKS_ON(Essn, Pno, Hours)
%works_on("123456789","1","32.5"). 
works_on("123456789","1",33).      % using integer values (workaround)
%works_on("123456789","2","7.5").
works_on("123456789","2",8).       % using integer values
works_on("666884444","3",40).
works_on("453453453","1",20).
works_on("453453453","2",20).
works_on("333445555","2",10).
works_on("333445555","3",10).
works_on("333445555","10",10).
works_on("333445555","20",10).
works_on("999887777","30",30).
works_on("999887777","10",10).
works_on("987987987","10",35).
works_on("987987987","30",5).
works_on("987654321","",20).
works_on("987654321","20",15).
%works_on("888665555","20","").     % This isn't a NULL value (empty string: "") 
works_on("888665555","20",null).   % This isn't a "proper" NULL value (as in SQL) either


% dependent(Essn,Dependent_name,Sex,Bdate,Relationship)
dependent("333445555","Alice","F","1986-04-05","Daughter").
dependent("333445555","Theodore","M","1983-10-25","Son").
dependent("333445555","Joy","F","1958-05-03","Spouse").
dependent("987654321","Abner","M","1942-02-28","Spouse").
dependent("123456789","Michael","M","1988-01-04","Son").
dependent("123456789","Alice","F","1988-12-30","Daughter").
dependent("123456789","Elizabeth","F","1967-05-05","Spouse").




% Q0: Retrieve the birth date and address of John B Smith: 
q0(DOB, Addr) :- employee("John","B","Smith",_, DOB,Addr,_,_,_,_).

% Q0a: List the social security numbers of employees who work more than 20 hours:
q0a(SSN, Hours) :- works_on(SSN, _, Hours), Hours > 20.

% Q0b: .. who work more than 20 hours per week on project 1 OR project 2:  
q0b(SSN,P,Hours) :- works_on(SSN,P,Hours), P = "1", Hours > 20.
q0b(SSN,P,Hours) :- works_on(SSN,P,Hours), P = "2", Hours > 20.

% Q0c: .. who work on project 1 AND project 2:  
q0c(SSN) :- works_on(SSN, "1", _), works_on(SSN, "2", _).

% Q1: List the name and address of all employees who work for the ‘Research’ department. 
q1(FN,LN,A) :- employee(FN,_,LN,_,_,A,_,_,_,D), department("Research",D,_,_).


% Q8: For each employee retrieve the employee’s first and last name
% as well as the first and last name of their immediate supervisor.

q8(FNe,LNe,FNs,LNs) :-
	employee(FNe,_,LNe,_,_,_,_,_,Super_SSN,_),
	employee(FNs,_,LNs,Super_SSN,_,_,_,_,_,_).


%#show q0/2.
%#show q0a/2.
%#show q0b/3.
%#show q0c/1.
%#show q1/3.
#show q8/4.