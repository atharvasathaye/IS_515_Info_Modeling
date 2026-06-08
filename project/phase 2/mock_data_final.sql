INSERT INTO traveler (employee_id, name, email, phone, position, department) VALUES
(1201, 'Traveler_1201', 'user1201@university.edu', '555-12201', 'Coordinator', 'Business'),
(1202, 'Traveler_1202', 'user1202@university.edu', '555-12202', 'Coordinator', 'Business'),
(1203, 'Traveler_1203', 'user1203@university.edu', '555-12203', 'Engineer', 'Finance'),
(1204, 'Traveler_1204', 'user1204@university.edu', '555-12204', 'Manager', 'Engineering'),
(1205, 'Traveler_1205', 'user1205@university.edu', '555-12205', 'Analyst', 'HR');

INSERT INTO travel_vendor (vendor_id, name, service_type, service_charge) VALUES
(1201, 'Traveler_1201', 'Self', 228.38),
(1202, 'Traveler_1202', 'Self', 219.46),
(1203, 'Traveler_1203', 'Self', 107.7),
(3204, 'Vendor_3204', 'Airfare', 383.91),
(3205, 'Vendor_3205', 'Airfare', 538.23),
(3206, 'Vendor_3206', 'Airfare', 580.19);

INSERT INTO travel_authorization (auth_id, supervisior_id, bgt_officer_id, employee_id, start_date, end_date, destination, auth_date, authorization_status) VALUES
('1201-1203-0', 1201, 1203, 1201, 2024-08-04, 2024-08-07, 'City_0', 2024-07-25, 'Approved'),
('1202-1204-1', 1202, 1204, 1202, 2024-03-25, 2024-03-29, 'City_1', 2024-03-16, 'Approved'),
('1201-1203-2', 1201, 1203, 1203, 2024-07-09, 2024-07-13, 'City_2', 2024-07-02, 'Approved'),
('1202-1204-3', 1202, 1204, 1204, 2024-11-01, 2024-11-03, 'City_3', 2024-10-22, 'Approved'),
('1201-1203-4', 1201, 1203, 1205, 2024-09-17, 2024-09-19, 'City_4', 2024-09-11, 'Approved'),
('1202-1204-5', 1202, 1204, 1201, 2024-06-30, 2024-07-02, 'City_5', 2024-06-27, 'Approved'),
('1201-1203-6', 1201, 1203, 1202, 2024-05-05, 2024-05-08, 'City_6', 2024-04-25, 'Approved'),
('1202-1204-7', 1202, 1204, 1203, 2024-05-06, 2024-05-09, 'City_7', 2024-04-28, 'Approved'),
('1201-1203-8', 1201, 1203, 1204, 2024-08-18, 2024-08-20, 'City_8', 2024-08-10, 'Approved'),
('1202-1204-9', 1202, 1204, 1205, 2024-02-20, 2024-02-25, 'City_9', 2024-02-17, 'Approved');

INSERT INTO travel_expense_report (request_id, employee_id, submission_date, status, auth_id, vendor_id, total_amount, trip_type) VALUES
(7300, 1201, 2024-08-08, 'Pending', '1201-1203-0', 3204, 1754.14, 'International'),
(7301, 1202, 2024-03-30, 'Approved', '1202-1204-1', 3206, 837.43, 'International'),
(7302, 1203, 2024-07-14, 'Approved', '1201-1203-2', 3206, 765.89, 'International'),
(7303, 1204, 2024-11-04, 'Submitted', '1202-1204-3', 3206, 1120.88, 'International'),
(7304, 1205, 2024-09-20, 'Approved', '1201-1203-4', 1201, 1535.82, 'International'),
(7305, 1201, 2024-07-03, 'Pending', '1202-1204-5', 1201, 1321.15, 'Domestic'),
(7306, 1202, 2024-05-09, 'Approved', '1201-1203-6', 3206, 1229.87, 'Domestic'),
(7307, 1203, 2024-05-10, 'Approved', '1202-1204-7', 1203, 1750.69, 'Domestic'),
(7308, 1204, 2024-08-21, 'Submitted', '1201-1203-8', 1203, 648.73, 'International'),
(7309, 1205, 2024-02-26, 'Submitted', '1202-1204-9', 3205, 1538.34, 'International');

INSERT INTO expense_item (expense_id, request_id, amount, type, payment_method, created_at, vendor_id) VALUES
(8500, 7300, 271.65, 'Airfare', 'Receipt', 2024-08-07, 3204),
(8501, 7300, 126.84, 'Self', 'Receipt', 2024-08-07, 1201),
(8502, 7301, 518.75, 'Self', 'Receipt', 2024-03-29, 1201),
(8503, 7301, 523.79, 'Self', 'Receipt', 2024-03-29, 1203),
(8504, 7302, 422.94, 'Airfare', 'Receipt', 2024-07-13, 3206),
(8505, 7302, 332.08, 'Airfare', 'Per Diem', 2024-07-13, 3205),
(8506, 7303, 426.22, 'Self', 'Receipt', 2024-11-03, 1201),
(8507, 7303, 462.28, 'Self', 'Per Diem', 2024-11-03, 1203),
(8508, 7304, 575.06, 'Self', 'Per Diem', 2024-09-19, 1203),
(8509, 7304, 266.13, 'Self', 'Per Diem', 2024-09-19, 1203),
(8510, 7305, 272.12, 'Self', 'Receipt', 2024-07-02, 1201),
(8511, 7305, 358.37, 'Airfare', 'Receipt', 2024-07-02, 3206),
(8512, 7306, 561.7, 'Airfare', 'Per Diem', 2024-05-08, 3204),
(8513, 7306, 169.42, 'Airfare', 'Per Diem', 2024-05-08, 3206),
(8514, 7307, 318.41, 'Self', 'Per Diem', 2024-05-09, 1201),
(8515, 7307, 507.92, 'Self', 'Per Diem', 2024-05-09, 1202),
(8516, 7308, 242.95, 'Airfare', 'Per Diem', 2024-08-20, 3205),
(8517, 7308, 339.02, 'Airfare', 'Receipt', 2024-08-20, 3205),
(8518, 7309, 113.57, 'Airfare', 'Per Diem', 2024-02-25, 3206),
(8519, 7309, 304.34, 'Self', 'Per Diem', 2024-02-25, 1202);

