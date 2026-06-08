-- DELETE existing data
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

