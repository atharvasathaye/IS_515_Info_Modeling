CREATE DATABASE travel_riembursment;

USE travel_riembursment;

BEGIN;

-- Drop tables if they exist (in the proper order to avoid FK constraint errors)
DROP TABLE IF EXISTS Reimbursement_Payment;
DROP TABLE IF EXISTS Expense_Item;
DROP TABLE IF EXISTS Travel_Expense_Report;
DROP TABLE IF EXISTS Travel_Authorization;
DROP TABLE IF EXISTS Travel_Vendor;
DROP TABLE IF EXISTS Budget_Officer;
DROP TABLE IF EXISTS Supervisor;
DROP TABLE IF EXISTS UFS;
DROP TABLE IF EXISTS Traveler;

-- Create Traveler table
CREATE TABLE Traveler (
    Employee_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(100),
    Position VARCHAR(100)
);

-- Create Travel_Vendor table
CREATE TABLE Travel_Vendor (
    Vendor_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Service_Type VARCHAR(100),
    Bill_Amount DECIMAL(10,2)
);

-- Create Travel_Authorization table
CREATE TABLE Travel_Authorization (
    Auth_ID INT PRIMARY KEY,
    Employee_ID INT,
    Trip_Purpose VARCHAR(255),
    Destination VARCHAR(255),
    Start_Date DATE,
    End_Date DATE,
    Auth_Date DATE,
    Approval_Status VARCHAR(20),
    FOREIGN KEY (Employee_ID) REFERENCES Traveler(Employee_ID)
);

-- Create Travel_Expense_Report table
CREATE TABLE Travel_Expense_Report (
    Report_ID INT PRIMARY KEY,
    Employee_ID INT,
    Auth_ID INT,
    Submission_Date DATE,
    Status VARCHAR(50),
    Total_Amount DECIMAL(10,2),
    Trip_Type ENUM('Domestic', 'International', 'Local'),
    FOREIGN KEY (Employee_ID) REFERENCES Traveler(Employee_ID),
    FOREIGN KEY (Auth_ID) REFERENCES Travel_Authorization(Auth_ID)
);

-- Create Budget_Officer table
CREATE TABLE Budget_Officer (
    Officer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Cost_Center VARCHAR(100)
);

-- Create Supervisor table
CREATE TABLE Supervisor (
    Supervisor_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(100),
    Position VARCHAR(100)
);

-- Create UFS (University Financial Services) table
CREATE TABLE UFS (
    UFS_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Compliance_Status VARCHAR(50)
);

-- Create Expense_Item table
CREATE TABLE Expense_Item (
    Expense_ID INT PRIMARY KEY,
    Report_ID INT,
    Vendor_ID INT,
    Type ENUM('Travel', 'Lodging', 'Meals', 'Airfare', 'Transport', 'Incidentals', 'Personal Vehicle'),
    Amount DECIMAL(10,2),
    Date DATE,
    Payment_Method ENUM('Procurement Card', 'Personal Funds', 'Receipt', 'Per Diem'),
    FOREIGN KEY (Report_ID) REFERENCES Travel_Expense_Report(Report_ID),
    FOREIGN KEY (Vendor_ID) REFERENCES Travel_Vendor(Vendor_ID)
);

-- Create Reimbursement_Payment table
CREATE TABLE Reimbursement_Payment (
    Payment_ID INT PRIMARY KEY,
    Report_ID INT,
    Employee_ID INT,
    Payment_Date DATE,
    Amount_Paid DECIMAL(10,2),
    Bank_Account VARCHAR(50),
    FOREIGN KEY (Report_ID) REFERENCES Travel_Expense_Report(Report_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Traveler(Employee_ID)
);

-- Insert Travelers (at least 5 individuals) 
INSERT INTO Traveler (Employee_ID, Name, Department, Position) VALUES (1001, 'Alice Smith', 'Business', 'Manager'), (1002, 'Bob Jones', 'Engineering', 'Engineer'), (1003, 'Carol White', 'HR', 'Specialist'), (1004, 'David Brown', 'Marketing', 'Coordinator'), (1005, 'Eva Green', 'Finance', 'Analyst');

-- Insert Travel_Vendor (sample vendors) 
INSERT INTO Travel_Vendor (Vendor_ID, Name, Service_Type, Bill_Amount) VALUES (3001, 'Airways Inc.', 'Airfare', 500.00), (3002, 'HotelStay', 'Lodging', 200.00), (3003, 'Rent-A-Car', 'Transport', 150.00);

-- Insert Budget_Officer (at least 2) 
INSERT INTO Budget_Officer (Officer_ID, Name, Cost_Center) VALUES (4001, 'Frank Miller', 'Cost Center A'), (4002, 'Grace Lee', 'Cost Center B');

-- Insert Supervisor (at least 2) 
INSERT INTO Supervisor (Supervisor_ID, Name, Department, Position) VALUES (5001, 'Henry Adams', 'Business', 'Supervisor'), (5002, 'Irene Black', 'Engineering', 'Lead Supervisor');

-- Insert UFS (University Financial Services) 
INSERT INTO UFS (UFS_ID, Name, Compliance_Status) VALUES (6001, 'UFS Officer', 'Approved');

-- Insert Travel_Authorization records (10 trips) 
INSERT INTO Travel_Authorization (Auth_ID, Employee_ID, Trip_Purpose, Destination, Start_Date, End_Date, Auth_Date, Approval_Status) VALUES (2001, 1001, 'Conference', 'New York', '2024-03-10', '2024-03-15', '2024-02-28', 'Approved'), (2002, 1002, 'Client Meeting', 'Chicago', '2024-04-05', '2024-04-07', '2024-03-20', 'Approved'), (2003, 1003, 'Training', 'Atlanta', '2024-05-12', '2024-05-14', '2024-04-30', 'Approved'), (2004, 1004, 'Workshop', 'Dallas', '2024-06-20', '2024-06-22', '2024-06-05', 'Approved'), (2005, 1005, 'Site Visit', 'Boston', '2024-07-15', '2024-07-17', '2024-07-01', 'Approved'), (2006, 1001, 'Seminar', 'Los Angeles', '2024-08-10', '2024-08-12', '2024-07-25', 'Approved'), (2007, 1002, 'Conference', 'San Francisco', '2024-09-05', '2024-09-10', '2024-08-20', 'Approved'), (2008, 1003, 'Sales Meeting', 'Miami', '2024-10-01', '2024-10-03', '2024-09-15', 'Approved'), (2009, 1004, 'Project Kickoff', 'Seattle', '2024-11-12', '2024-11-14', '2024-10-30', 'Approved'), (2010, 1005, 'Training', 'Denver', '2024-12-05', '2024-12-07', '2024-11-25', 'Approved');

-- Insert Travel_Expense_Report records (each report corresponds to an authorization) 
INSERT INTO Travel_Expense_Report (Report_ID, Employee_ID, Auth_ID, Submission_Date, Status, Total_Amount, Trip_Type) VALUES (7001, 1001, 2001, '2024-03-16', 'Submitted', 1200.00, 'Domestic'), (7002, 1002, 2002, '2024-04-08', 'Submitted', 800.00, 'Domestic'), (7003, 1003, 2003, '2024-05-15', 'Submitted', 950.00, 'Domestic'), (7004, 1004, 2004, '2024-06-23', 'Submitted', 1100.00, 'Domestic'), (7005, 1005, 2005, '2024-07-18', 'Submitted', 1300.00, 'Domestic'), (7006, 1001, 2006, '2024-08-13', 'Submitted', 1500.00, 'International'), (7007, 1002, 2007, '2024-09-11', 'Submitted', 700.00, 'Domestic'), (7008, 1003, 2008, '2024-10-04', 'Submitted', 900.00, 'Domestic'), (7009, 1004, 2009, '2024-11-15', 'Submitted', 1600.00, 'Domestic'), (7010, 1005, 2010, '2024-12-08', 'Submitted', 850.00, 'Domestic');

-- Insert Expense_Item records (each report may have multiple expense items) -- Ensure that at least two transportation types appear (e.g., 'Airfare', 'Personal Vehicle') 
INSERT INTO Expense_Item (Expense_ID, Report_ID, Vendor_ID, Type, Amount, Date, Payment_Method) VALUES (8001, 7001, 3001, 'Airfare', 500.00, '2024-03-11', 'Receipt'), (8002, 7001, 3002, 'Lodging', 400.00, '2024-03-12', 'Procurement Card'), (8003, 7002, 3001, 'Airfare', 400.00, '2024-04-06', 'Receipt'), (8004, 7003, 3002, 'Lodging', 450.00, '2024-05-13', 'Procurement Card'), (8005, 7004, 3003, 'Transport', 100.00, '2024-06-21', 'Personal Funds'), (8006, 7005, 3002, 'Lodging', 600.00, '2024-07-16', 'Procurement Card'), (8007, 7006, 3001, 'Airfare', 700.00, '2024-08-11', 'Receipt'), (8008, 7007, 3003, 'Transport', 150.00, '2024-09-06', 'Personal Funds'), (8009, 7008, 3002, 'Lodging', 500.00, '2024-10-02', 'Procurement Card'), (8010, 7009, 3001, 'Airfare', 800.00, '2024-11-13', 'Receipt'), (8011, 7010, 3003, 'Transport', 120.00, '2024-12-06', 'Personal Funds'), (8012, 7010, 3002, 'Lodging', 200.00, '2024-12-07', 'Procurement Card'), (8013, 7004, 3003, 'Personal Vehicle', 50.00, '2024-06-22', 'Personal Funds');

-- Insert Reimbursement_Payment records (associating some reports with reimbursement payments) 
INSERT INTO Reimbursement_Payment (Payment_ID, Report_ID, Employee_ID, Payment_Date, Amount_Paid, Bank_Account) VALUES (9001, 7001, 1001, '2024-03-20', 1200.00, 'BA1001'), (9002, 7005, 1005, '2024-07-20', 1300.00, 'BA1005'), (9003, 7006, 1001, '2024-08-15', 1500.00, 'BA1001'), (9004, 7009, 1004, '2024-11-20', 1600.00, 'BA1004');



DELETE FROM Reimbursement_Payment;
DELETE FROM Expense_Item;
DELETE FROM Travel_Expense_Report;
DELETE FROM Travel_Authorization;
DELETE FROM Travel_Vendor;
DELETE FROM Budget_Officer;
DELETE FROM Supervisor;
DELETE FROM UFS;
DELETE FROM Traveler;

-- INSERT statements for mock data
INSERT INTO Traveler (Employee_ID, Name, Department, Position) VALUES
(1001, 'Traveler_1001', 'HR', 'Manager'),
(1002, 'Traveler_1002', 'Business', 'Analyst'),
(1003, 'Traveler_1003', 'Engineering', 'Manager'),
(1004, 'Traveler_1004', 'Finance', 'Coordinator'),
(1005, 'Traveler_1005', 'Engineering', 'Engineer');

INSERT INTO Travel_Vendor (Vendor_ID, Name, Service_Type, Bill_Amount) VALUES
(3001, 'Vendor_3001', 'Lodging', 416.28),
(3002, 'Vendor_3002', 'Incidentals', 201.23),
(3003, 'Vendor_3003', 'Transport', 492.43),
(3004, 'Vendor_3004', 'Airfare', 739.87),
(3005, 'Vendor_3005', 'Airfare', 749.31);

INSERT INTO Travel_Authorization (Auth_ID, Employee_ID, Trip_Purpose, Destination, Start_Date, End_Date, Auth_Date, Approval_Status) VALUES
(2001, 1001, 'Purpose_2001', 'City_2001', 2024-04-06, 2024-04-07, 2024-04-04, 'Approved'),
(2002, 1003, 'Purpose_2002', 'City_2002', 2024-10-07, 2024-10-08, 2024-10-04, 'Pending'),
(2003, 1003, 'Purpose_2003', 'City_2003', 2024-02-10, 2024-02-15, 2024-02-09, 'Approved'),
(2004, 1005, 'Purpose_2004', 'City_2004', 2024-08-26, 2024-08-27, 2024-08-22, 'Denied'),
(2005, 1002, 'Purpose_2005', 'City_2005', 2024-08-22, 2024-08-28, 2024-08-13, 'Approved'),
(2006, 1002, 'Purpose_2006', 'City_2006', 2024-02-01, 2024-02-05, 2024-01-26, 'Approved'),
(2007, 1004, 'Purpose_2007', 'City_2007', 2024-03-12, 2024-03-14, 2024-03-09, 'Approved'),
(2008, 1001, 'Purpose_2008', 'City_2008', 2024-12-09, 2024-12-11, 2024-12-08, 'Approved'),
(2009, 1005, 'Purpose_2009', 'City_2009', 2024-02-03, 2024-02-06, 2024-02-01, 'Pending'),
(2010, 1002, 'Purpose_2010', 'City_2010', 2024-01-26, 2024-02-01, 2024-01-18, 'Pending');

INSERT INTO Travel_Expense_Report (Report_ID, Employee_ID, Auth_ID, Submission_Date, Status, Total_Amount, Trip_Type) VALUES
(7001, 1001, 2001, 2024-04-08, 'Pending', 979.32, 'Domestic'),
(7002, 1003, 2002, 2024-10-09, 'Submitted', 358.61, 'Domestic'),
(7003, 1003, 2003, 2024-02-16, 'Submitted', 1303.26, 'Local'),
(7004, 1005, 2004, 2024-08-28, 'Submitted', 921.1, 'International'),
(7005, 1002, 2005, 2024-08-29, 'Pending', 816.4, 'International'),
(7006, 1002, 2006, 2024-02-06, 'Approved', 1682.0, 'International'),
(7007, 1004, 2007, 2024-03-15, 'Pending', 1866.43, 'Domestic'),
(7008, 1001, 2008, 2024-12-12, 'Pending', 1443.22, 'International'),
(7009, 1005, 2009, 2024-02-07, 'Pending', 1756.11, 'International'),
(7010, 1002, 2010, 2024-02-02, 'Submitted', 645.62, 'Local');

INSERT INTO Expense_Item (Expense_ID, Report_ID, Vendor_ID, Type, Amount, Date, Payment_Method) VALUES
(8001, 7001, 3003, 'Transport', 427.56, 2024-04-05, 'Per Diem'),
(8002, 7001, 3005, 'Airfare', 386.6, 2024-04-03, 'Personal Funds'),
(8003, 7001, 3004, 'Airfare', 487.9, 2024-04-04, 'Per Diem'),
(8004, 7002, 3004, 'Airfare', 304.36, 2024-10-08, 'Per Diem'),
(8005, 7002, 3004, 'Airfare', 305.16, 2024-10-04, 'Receipt'),
(8006, 7002, 3002, 'Incidentals', 252.63, 2024-10-05, 'Receipt'),
(8007, 7003, 3003, 'Transport', 194.16, 2024-02-12, 'Personal Funds'),
(8008, 7003, 3003, 'Transport', 442.18, 2024-02-15, 'Personal Funds'),
(8009, 7004, 3002, 'Incidentals', 356.42, 2024-08-23, 'Procurement Card'),
(8010, 7005, 3005, 'Airfare', 296.15, 2024-08-28, 'Per Diem'),
(8011, 7006, 3001, 'Lodging', 67.44, 2024-02-01, 'Receipt'),
(8012, 7007, 3003, 'Transport', 358.27, 2024-03-12, 'Procurement Card'),
(8013, 7008, 3005, 'Airfare', 438.48, 2024-12-08, 'Personal Funds'),
(8014, 7008, 3004, 'Airfare', 160.67, 2024-12-08, 'Procurement Card'),
(8015, 7008, 3005, 'Airfare', 114.21, 2024-12-08, 'Receipt'),
(8016, 7009, 3003, 'Transport', 97.57, 2024-02-05, 'Per Diem'),
(8017, 7009, 3002, 'Incidentals', 407.57, 2024-02-06, 'Personal Funds'),
(8018, 7010, 3004, 'Airfare', 323.0, 2024-01-31, 'Procurement Card');

INSERT INTO Reimbursement_Payment (Payment_ID, Report_ID, Employee_ID, Payment_Date, Amount_Paid, Bank_Account) VALUES
(9001, 7004, 1005, 2024-08-30, 921.1, 'BA1005'),
(9002, 7005, 1002, 2024-08-31, 816.4, 'BA1002'),
(9003, 7007, 1004, 2024-03-17, 1866.43, 'BA1004'),
(9004, 7006, 1002, 2024-02-08, 1682.0, 'BA1002'),
(9005, 7001, 1001, 2024-04-10, 979.32, 'BA1001');