-- USE an existing database
USE TravelManagement;


-- Drop & Create University Table
/*DROP TABLE IF EXISTS university;

CREATE TABLE university (
    university_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    contact VARCHAR(100)
);
*/
-- Drop & Create Traveler Table
DROP TABLE IF EXISTS traveler;
CREATE TABLE traveler ( 
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    position varchar(50) not null,
    department varchar(50) not null -- Should we add the department id? Maybe not
);


DROP TABLE IF EXISTS travel_autorization;
CREATE TABLE travel_authorization(
	supervisior_id varchar(100) not null,
    bgt_officer_id varchar(100) not null,
    auth_id varchar(200) generated always AS
		(concat(supervisior_id+'-'+bgt_officer_id)) STORED not null primary KEY,
    start_date date not null,
    end_date date,
    destination varchar(100),
    employee_id int not null,
    auth_date date not null,
    -- trip purpose and approve status is not necessary
    FOREIGN KEY(supervisior_id) references supervisior(supervisior_id),
    FOREIGN KEY(bgt_officer_id) references bgt_officer(bgt_officer_id)
);

DROP TABLE IF EXISTS supervisior;
CREATE TABLE supervisior(
	supervisior_no int auto_increment primary key,
	supervisior_id int,
    name varchar(50),
    
    FOREIGN KEY(supervisior_id) references traveler(employee_id)
);

DROP TABLE IF EXISTS bgt_officer;
CREATE TABLE bgt_officer(
	bgt_officer_no int auto_increment primary key,
	bgt_officer_id int,
    name varchar(50),
    
    FOREIGN KEY(bgt_officer_id) references traveler(employee_id)
);


-- Drop & Create Expense_Type Table
-- DROP TABLE IF EXISTS expense_type;
/*CREATE TABLE expense_type (
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_description VARCHAR(100) NOT NULL
);*/

-- Drop & Create Travel_Vendor Table
DROP TABLE IF EXISTS travel_vendor;
CREATE TABLE travel_vendor (
    vendor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    service_type varchar(100) NOT NULL,
    service_charge DOUBLE NOT NULL
);

-- Drop & Create Travel_Expense_Request Table
DROP TABLE IF EXISTS travel_expense_report;
CREATE TABLE travel_expense_report (
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    submission_date DATE,
    status VARCHAR(50),
    total_amount DECIMAL(10, 2),
    auth_id varchar(50) not null,
    -- processed_by INT,
    FOREIGN KEY (traveler_id) REFERENCES traveler(employee_id),
    foreign key (auth_id) references travel_authorization(auth_id)
	-- FOREIGN KEY (processed_by) REFERENCES traveler(employee_id)
);

-- Drop & Create Expense_Item Table
DROP TABLE IF EXISTS expense_item;
CREATE TABLE expense_item (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    request_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    type INT,
    payment_method varchar(50) NOT NULL,
    created_at date default current_timestamp, -- MIGHT HAVE TO CHANGE THIS
    FOREIGN KEY (request_id) REFERENCES travel_expense_report(request_id),
    FOREIGN KEY (type) REFERENCES travel_vendor(service_type),
    FOREIGN KEY (amount) REFERENCES travel_vendor(service_charge)
    
);

-- Drop & Create Reimbursement Table
DROP TABLE IF EXISTS reimbursement_pay;
CREATE TABLE reimbursement_pay (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    request_id INT, -- REPORT ID
    -- payment_method VARCHAR(50),
    payment_date DATE NOT NULL,
    FOREIGN KEY (request_id) REFERENCES travel_expense_report(request_id)
);

-- Drop & Create Travel_Authorization Table
/*DROP TABLE IF EXISTS travel_authorization;
CREATE TABLE travel_authorization (
    auth_id INT AUTO_INCREMENT PRIMARY KEY,
    traveler_id INT,
    supervisor_id INT,
    budget_officer_id INT,
    purpose VARCHAR(255),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (traveler_id) REFERENCES traveler(traveler_id),
    FOREIGN KEY (supervisor_id) REFERENCES traveler(traveler_id),
    FOREIGN KEY (budget_officer_id) REFERENCES traveler(traveler_id)
);*/


DROP TABLE IF EXISTS university_financial_services;
CREATE TABLE university_financial_services(
	ufs_id int AUTO_INCREMENT PRIMARY KEY,
    status varchar(50) NOT NULL,
    name varchar(50) NOT NULL,
    report_id varchar(50) NOT NULL,
    
    FOREIGN KEY (status) REFERENCES travel_expense_report(status),
    FOREIGN KEY (report_id) REFERENCES travel_expense_report(report_id)
);

