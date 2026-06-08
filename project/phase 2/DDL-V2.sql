-- USE an existing database

CREATE database IS515DataWarehouseFinalProject;
USE IS515DataWarehouseFinalProject;


-- DROP TABLE IF EXISTS traveler;
CREATE TABLE traveler ( 
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    position varchar(50) not null,
    department varchar(50) not null -- Should we add the department id? Maybe not
);

-- DROP TABLE IF EXISTS supervisior;
CREATE TABLE supervisior(
	supervisior_no int primary key,
	supervisior_id int,
    name varchar(50),
    FOREIGN KEY(supervisior_id) references traveler(employee_id)
);

-- DROP TABLE IF EXISTS bgt_officer;
CREATE TABLE bgt_officer(
	bgt_officer_no int primary key,
	bgt_officer_id int,
    name varchar(50),
    FOREIGN KEY(bgt_officer_id) references traveler(employee_id)
);


-- Drop & Create Travel_Vendor Table
-- DROP TABLE IF EXISTS travel_vendor;
CREATE TABLE travel_vendor (
    vendor_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    service_type varchar(100) NOT NULL,
    service_charge DOUBLE NOT NULL
);

-- DROP TABLE IF EXISTS travel_autorization;
CREATE TABLE travel_authorization(
	supervisior_id int not null,
    bgt_officer_id int not null,
    auth_id varchar(200) generated always AS
		(concat(supervisior_id+'-'+bgt_officer_id)) STORED not null primary KEY,
    start_date date not null,
    end_date date,
    destination varchar(100),
    employee_id int not null,
    auth_date date not null,
    authorization_status char, -- D OR A, for denied and Approved
    FOREIGN KEY(supervisior_id) references supervisior(supervisior_id),
    FOREIGN KEY(bgt_officer_id) references bgt_officer(bgt_officer_id)
);


-- Drop & Create Travel_Expense_Request Table
-- DROP TABLE IF EXISTS travel_expense_report;
CREATE TABLE travel_expense_report (
    request_id INT PRIMARY KEY,
    employee_id INT,
    submission_date DATE,
    status VARCHAR(50),
    -- total_amount double, -- foreign key change from vendor, cannot take as it is not a pk. need vendor_id instead
    auth_id varchar(50) not null,
    vendor_id INT,
	FOREIGN KEY (vendor_id) REFERENCES travel_vendor(vendor_id),
    FOREIGN KEY (employee_id) REFERENCES traveler(employee_id),
    foreign key (auth_id) references travel_authorization(auth_id)
	-- FOREIGN KEY (total_amount) references travel_vendor(service_charge)
	-- FOREIGN KEY (processed_by) REFERENCES traveler(employee_id)
);


-- Drop & Create Expense_Item Table
-- DROP TABLE IF EXISTS expense_item;
CREATE TABLE expense_item (
    expense_id INT PRIMARY KEY,
    request_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    type INT,
    payment_method varchar(50) NOT NULL,
    created_at datetime,
    vendor_id INT,
	FOREIGN KEY (vendor_id) REFERENCES travel_vendor(vendor_id),
    FOREIGN KEY (request_id) REFERENCES travel_expense_report(request_id)
    -- FOREIGN KEY (type) REFERENCES travel_vendor(service_type)
    -- FOREIGN KEY (amount) REFERENCES travel_vendor(service_charge)-- 
);

-- Drop & Create Reimbursement Table
-- DROP TABLE IF EXISTS reimbursement_pay;
CREATE TABLE reimbursement_pay (
    payment_id INT PRIMARY KEY,
    request_id INT, -- REPORT ID
    payment_method varchar(100) null,
    payment_date DATE NOT NULL,
    FOREIGN KEY (request_id) REFERENCES travel_expense_report(request_id)
    -- employee id
);


-- DROP TABLE IF EXISTS university_financial_services;
CREATE TABLE university_financial_services(
	ufs_id int PRIMARY KEY,
    status varchar(50) NOT NULL, -- not to be connected
    name varchar(50) NOT NULL,
    report_id int NOT NULL,
    
    -- FOREIGN KEY (status) REFERENCES travel_expense_report(status),
    FOREIGN KEY (report_id) REFERENCES travel_expense_report(request_id)
);


