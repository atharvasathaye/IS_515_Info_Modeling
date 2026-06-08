-- Create Database
CREATE DATABASE TravelManagement;
USE TravelManagement;

-- Create University Table
CREATE TABLE University (
    University_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    Contact VARCHAR(100)
);

-- Create Traveler Table
CREATE TABLE Traveler (
    Traveler_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15)
);

-- Create Expense_Type Table
CREATE TABLE Expense_Type (
    Type_ID INT AUTO_INCREMENT PRIMARY KEY,
    Type_Description VARCHAR(100) NOT NULL
);

-- Create Travel_Vendor Table
CREATE TABLE Travel_Vendor (
    Vendor_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Contact_Info VARCHAR(100)
);

-- Create Travel_Expense_Request Table
CREATE TABLE Travel_Expense_Request (
    Request_ID INT AUTO_INCREMENT PRIMARY KEY,
    Traveler_ID INT,
    Submission_Date DATE,
    Status VARCHAR(50),
    Total_Amount DECIMAL(10, 2),
    Processed_By INT,
    FOREIGN KEY (Traveler_ID) REFERENCES Traveler(Traveler_ID),
    FOREIGN KEY (Processed_By) REFERENCES Traveler(Traveler_ID)  -- Assuming Processed_By is also a Traveler
);

-- Create Expense_Item Table
CREATE TABLE Expense_Item (
    Item_ID INT AUTO_INCREMENT PRIMARY KEY,
    Request_ID INT,
    Description VARCHAR(255) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Type INT,
    FOREIGN KEY (Request_ID) REFERENCES Travel_Expense_Request(Request_ID),
    FOREIGN KEY (Type) REFERENCES Expense_Type(Type_ID)
);

-- Create Reimbursement Table
CREATE TABLE Reimbursement (
    Reimbursement_ID INT AUTO_INCREMENT PRIMARY KEY,
    Request_ID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    Payment_Method VARCHAR(50),
    Date_Paid DATE,
    FOREIGN KEY (Request_ID) REFERENCES Travel_Expense_Request(Request_ID)
);

-- Create Travel_Authorization Table
CREATE TABLE Travel_Authorization (
    Authorization_ID INT AUTO_INCREMENT PRIMARY KEY,
    Traveler_ID INT,
    Supervisor_ID INT,
    Budget_Officer_ID INT,
    Purpose VARCHAR(255),
    Start_Date DATE,
    End_Date DATE,
    FOREIGN KEY (Traveler_ID) REFERENCES Traveler(Traveler_ID),
    FOREIGN KEY (Supervisor_ID) REFERENCES Traveler(Traveler_ID),  -- Assuming Supervisor is also a Traveler
    FOREIGN KEY (Budget_Officer_ID) REFERENCES Traveler(Traveler_ID)  -- Assuming Budget Officer is also a Traveler
);