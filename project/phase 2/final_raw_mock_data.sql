INSERT INTO traveler (employee_id, name, email, phone, position, department) VALUES
(1301, 'Traveler_1301', 'user1301@example.com', '555-13301', 'Coordinator', 'Finance'),
(1302, 'Traveler_1302', 'user1302@example.com', '555-13302', 'Analyst', 'Marketing'),
(1303, 'Traveler_1303', 'user1303@example.com', '555-13303', 'Manager', 'Business'),
(1304, 'Traveler_1304', 'user1304@example.com', '555-13304', 'Manager', 'Marketing'),
(1305, 'Traveler_1305', 'user1305@example.com', '555-13305', 'Manager', 'Marketing');

INSERT INTO supervisior (supervisior_no, supervisior_id, name) VALUES
(1, 1301, 'Supervisor A'),
(2, 1302, 'Supervisor B');

INSERT INTO bgt_officer (bgt_officer_no, bgt_officer_id, name) VALUES
(1, 1303, 'Officer A'),
(2, 1304, 'Officer B');

INSERT INTO travel_vendor (vendor_id, name, service_type, service_charge) VALUES
(1301, 'Traveler_1301', 'Self', 235.6),
(1302, 'Traveler_1302', 'Self', 102.74),
(1303, 'Traveler_1303', 'Self', 157.51),
(3304, 'Vendor_3304', 'Transport', 543.31),
(3305, 'Vendor_3305', 'Airfare', 322.18),
(3306, 'Vendor_3306', 'Transport', 506.29);

INSERT INTO travel_authorization (supervisior_id, bgt_officer_id, auth_id, start_date, end_date, destination, employee_id, auth_date, authorization_status) VALUES
(1301, 1303, '1301-1303', 2024-06-15, 2024-06-16, 'City_0', 1301, 2024-06-10, 'A'),
(1302, 1304, '1302-1304', 2024-07-27, 2024-07-29, 'City_1', 1302, 2024-07-23, 'A'),
(1301, 1303, '1301-1303', 2024-05-21, 2024-05-25, 'City_2', 1303, 2024-05-16, 'A'),
(1302, 1304, '1302-1304', 2024-04-02, 2024-04-03, 'City_3', 1304, 2024-03-31, 'A'),
(1301, 1303, '1301-1303', 2024-01-23, 2024-01-27, 'City_4', 1305, 2024-01-19, 'A'),
(1302, 1304, '1302-1304', 2024-04-24, 2024-04-28, 'City_5', 1301, 2024-04-20, 'A'),
(1301, 1303, '1301-1303', 2024-04-18, 2024-04-20, 'City_6', 1302, 2024-04-16, 'A'),
(1302, 1304, '1302-1304', 2024-04-08, 2024-04-13, 'City_7', 1303, 2024-04-01, 'A'),
(1301, 1303, '1301-1303', 2024-06-28, 2024-07-01, 'City_8', 1304, 2024-06-22, 'A'),
(1302, 1304, '1302-1304', 2024-05-31, 2024-06-02, 'City_9', 1305, 2024-05-27, 'A');

INSERT INTO travel_expense_report (request_id, employee_id, submission_date, status) VALUES
(7400, 1301, 2024-06-17, 'Approved'),
(7401, 1302, 2024-07-30, 'Pending'),
(7402, 1303, 2024-05-26, 'Pending'),
(7403, 1304, 2024-04-04, 'Pending'),
(7404, 1305, 2024-01-28, 'Submitted'),
(7405, 1301, 2024-04-29, 'Submitted'),
(7406, 1302, 2024-04-21, 'Submitted'),
(7407, 1303, 2024-04-14, 'Submitted'),
(7408, 1304, 2024-07-02, 'Pending'),
(7409, 1305, 2024-06-03, 'Pending');

INSERT INTO expense_item (expense_id, request_id, vendor_id, amount, type, payment_method, created_at) VALUES
(8600, 7400, 1302, 142.88, 'Self', 'Per Diem', 2024-06-16),
(8601, 7400, 1301, 359.66, 'Self', 'Receipt', 2024-06-16),
(8602, 7401, 1301, 533.24, 'Self', 'Receipt', 2024-07-29),
(8603, 7401, 3305, 286.15, 'Airfare', 'Receipt', 2024-07-29),
(8604, 7402, 3305, 428.79, 'Airfare', 'Per Diem', 2024-05-25),
(8605, 7402, 1302, 471.35, 'Self', 'Receipt', 2024-05-25),
(8606, 7403, 3305, 352.84, 'Airfare', 'Receipt', 2024-04-03),
(8607, 7403, 1302, 508.03, 'Self', 'Receipt', 2024-04-03),
(8608, 7404, 1301, 272.4, 'Self', 'Receipt', 2024-01-27),
(8609, 7404, 3305, 178.53, 'Airfare', 'Per Diem', 2024-01-27),
(8610, 7405, 1301, 525.17, 'Self', 'Per Diem', 2024-04-28),
(8611, 7405, 1303, 528.73, 'Self', 'Per Diem', 2024-04-28),
(8612, 7406, 3304, 169.22, 'Transport', 'Receipt', 2024-04-20),
(8613, 7406, 1301, 417.35, 'Self', 'Per Diem', 2024-04-20),
(8614, 7407, 1301, 454.09, 'Self', 'Receipt', 2024-04-13),
(8615, 7407, 3305, 209.08, 'Airfare', 'Receipt', 2024-04-13),
(8616, 7408, 3305, 287.44, 'Airfare', 'Per Diem', 2024-07-01),
(8617, 7408, 1303, 321.93, 'Self', 'Per Diem', 2024-07-01),
(8618, 7409, 3305, 268.36, 'Airfare', 'Receipt', 2024-06-02),
(8619, 7409, 3306, 345.44, 'Transport', 'Per Diem', 2024-06-02);

