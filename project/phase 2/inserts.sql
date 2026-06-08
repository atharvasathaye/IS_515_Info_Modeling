-- === TRAVELER ===
INSERT INTO traveler VALUES (101, 'Alice Smith', 'alice@example.com', '1234567890', 'Manager', 'Finance');
INSERT INTO traveler VALUES (102, 'Bob Johnson', 'bob@example.com', '1234567891', 'Officer', 'Finance');
INSERT INTO traveler VALUES (103, 'Cathy Lee', 'cathy@example.com', '1234567892', 'Engineer', 'IT');
INSERT INTO traveler VALUES (104, 'Dan Brown', 'dan@example.com', '1234567893', 'Analyst', 'HR');
INSERT INTO traveler VALUES (105, 'Eva White', 'eva@example.com', '1234567894', 'Developer', 'Marketing');
INSERT INTO traveler VALUES (106, 'Riya Kapoor', 'riya@example.com', '1234567895', 'Researcher', 'Biology');
INSERT INTO traveler VALUES (107, 'Carlos Vega', 'carlos@example.com', '1234567896', 'Coordinator', 'Chemistry');
INSERT INTO traveler VALUES (108, 'Meera Nair', 'meera@example.com', '1234567897', 'Assistant', 'HR');
INSERT INTO traveler VALUES (109, 'James Patel', 'james@example.com', '1234567898', 'Scientist', 'Physics');
INSERT INTO traveler VALUES (110, 'Nina Chen', 'nina@example.com', '1234567899', 'Technician', 'Robotics');

-- === SUPERVISIOR ===
INSERT INTO supervisior VALUES (101, 'Alice Smith');
INSERT INTO supervisior VALUES (103, 'Cathy Lee');
INSERT INTO supervisior VALUES (106, 'Riya Kapoor');
INSERT INTO supervisior VALUES (108, 'Meera Nair');

-- === BGT_OFFICER ===
INSERT INTO bgt_officer VALUES (102, 'Bob Johnson');
INSERT INTO bgt_officer VALUES (104, 'Dan Brown');
INSERT INTO bgt_officer VALUES (107, 'Carlos Vega');
INSERT INTO bgt_officer VALUES (109, 'James Patel');

-- === TRAVEL_VENDOR ===
INSERT INTO travel_vendor VALUES (1, 'Delta Airlines', 'Air', 400.00);
INSERT INTO travel_vendor VALUES (2, 'City Taxi', 'Taxi', 50.00);
INSERT INTO travel_vendor VALUES (3, 'Enterprise', 'Personal Vehicle', 100.00);
INSERT INTO travel_vendor VALUES (4, 'RedCab', 'Taxi', 45.00);
INSERT INTO travel_vendor VALUES (5, 'GreenWheels', 'Car Rental', 80.00);
INSERT INTO travel_vendor VALUES (103, 'Cathy Lee', 'self', 0.00);
INSERT INTO travel_vendor VALUES (104, 'Dan Brown', 'self', 0.00);
INSERT INTO travel_vendor VALUES (105, 'Eva White', 'self', 0.00);
INSERT INTO travel_vendor VALUES (108, 'Meera Nair', 'self', 0.00);
INSERT INTO travel_vendor VALUES (109, 'James Patel', 'self', 0.00);

-- === TRAVEL_AUTHORIZATION ===
INSERT INTO travel_authorization VALUES (101, 102, 1, '2024-01-08', '2024-01-10', 'Chicago', 103, '2024-01-05', 'A');
INSERT INTO travel_authorization VALUES (103, 104, 2, '2024-01-12', '2024-01-14', 'New York', 105, '2024-01-10', 'D');
INSERT INTO travel_authorization VALUES (101, 102, 3, '2024-01-16', '2024-01-18', 'Austin', 103, '2024-01-14', 'A');
INSERT INTO travel_authorization VALUES (101, 102, 4, '2024-01-20', '2024-01-22', 'Houston', 104, '2024-01-18', 'A');
INSERT INTO travel_authorization VALUES (101, 102, 5, '2024-01-24', '2024-01-26', 'Boston', 104, '2024-01-22', 'D');
INSERT INTO travel_authorization VALUES (103, 104, 6, '2024-01-28', '2024-01-30', 'Seattle', 105, '2024-01-26', 'A');
INSERT INTO travel_authorization VALUES (103, 104, 7, '2024-02-02', '2024-02-04', 'Denver', 105, '2024-01-30', 'D');
INSERT INTO travel_authorization VALUES (101, 102, 8, '2024-02-06', '2024-02-08', 'San Jose', 103, '2024-02-04', 'A');
INSERT INTO travel_authorization VALUES (103, 104, 9, '2024-02-10', '2024-02-12', 'Orlando', 104, '2024-02-08', 'A');
INSERT INTO travel_authorization VALUES (101, 102, 10, '2024-02-14', '2024-02-16', 'Phoenix', 105, '2024-02-12', 'A');
INSERT INTO travel_authorization VALUES (101, 102, 11, '2024-02-18', '2024-02-20', 'Atlanta', 106, '2024-02-16', 'A');
INSERT INTO travel_authorization VALUES (103, 104, 12, '2024-02-22', '2024-02-24', 'San Diego', 107, '2024-02-20', 'D');
INSERT INTO travel_authorization VALUES (106, 107, 13, '2024-02-25', '2024-02-27', 'Dallas', 108, '2024-02-23', 'A');
INSERT INTO travel_authorization VALUES (106, 107, 14, '2024-03-01', '2024-03-03', 'Las Vegas', 109, '2024-02-28', 'A');
INSERT INTO travel_authorization VALUES (108, 109, 15, '2024-03-05', '2024-03-07', 'Tampa', 110, '2024-03-03', 'D');
INSERT INTO travel_authorization VALUES (108, 109, 16, '2024-03-10', '2024-03-12', 'Detroit', 108, '2024-03-08', 'A');
INSERT INTO travel_authorization VALUES (101, 102, 17, '2024-03-14', '2024-03-16', 'Cleveland', 103, '2024-03-12', 'A');
INSERT INTO travel_authorization VALUES (106, 104, 18, '2024-03-18', '2024-03-20', 'Miami', 107, '2024-03-16', 'A');
INSERT INTO travel_authorization VALUES (106, 107, 19, '2024-03-22', '2024-03-24', 'Salt Lake City', 109, '2024-03-20', 'D');
INSERT INTO travel_authorization VALUES (103, 104, 20, '2024-03-26', '2024-03-28', 'Nashville', 110, '2024-03-24', 'A');

-- === TRAVEL_EXPENSE_REPORT ===
INSERT INTO travel_expense_report VALUES (1, 103, '2024-01-09', 'Approved', 1, 1);
INSERT INTO travel_expense_report VALUES (2, 105, '2024-01-13', 'Denied', 2, 2);
INSERT INTO travel_expense_report VALUES (3, 103, '2024-01-17', 'Approved', 3, 1);
INSERT INTO travel_expense_report VALUES (4, 104, '2024-01-21', 'Approved', 4, 2);
INSERT INTO travel_expense_report VALUES (5, 105, '2024-01-27', 'Denied', 5, 3);
INSERT INTO travel_expense_report VALUES (6, 106, '2024-02-19', 'Approved', 11, 4);
INSERT INTO travel_expense_report VALUES (7, 107, '2024-02-23', 'Denied', 12, 5);
INSERT INTO travel_expense_report VALUES (8, 108, '2024-02-26', 'Approved', 13, 5);
INSERT INTO travel_expense_report VALUES (9, 109, '2024-03-02', 'Approved', 14, 1);
INSERT INTO travel_expense_report VALUES (10, 110, '2024-03-04', 'Denied', 15, 2);
INSERT INTO travel_expense_report VALUES (11, 108, '2024-03-11', 'Approved', 16, 3);
INSERT INTO travel_expense_report VALUES (12, 103, '2024-03-13', 'Approved', 17, 1);

-- === EXPENSE_ITEM ===
INSERT INTO expense_item VALUES (1, 1, 350.00, 1, 'receipt', '2024-01-09 09:00:00', 1);
INSERT INTO expense_item VALUES (2, 1, 45.00, 2, 'per diem', '2024-01-09 11:00:00', 1);
INSERT INTO expense_item VALUES (3, 2, 50.00, 1, 'receipt', '2024-01-13 09:00:00', 2);
INSERT INTO expense_item VALUES (4, 2, 25.00, 2, 'per diem', '2024-01-13 11:00:00', 2);
INSERT INTO expense_item VALUES (5, 3, 380.00, 1, 'receipt', '2024-01-17 09:00:00', 1);
INSERT INTO expense_item VALUES (6, 4, 60.00, 1, 'per diem', '2024-01-21 10:00:00', 2);
INSERT INTO expense_item VALUES (7, 5, 55.00, 1, 'receipt', '2024-01-27 08:00:00', 3);
INSERT INTO expense_item VALUES (8, 6, 90.00, 2, 'receipt', '2024-02-19 09:00:00', 4);
INSERT INTO expense_item VALUES (9, 7, 0.00, 2, 'per diem', '2024-02-23 08:30:00', 5);
INSERT INTO expense_item VALUES (10, 8, 65.00, 1, 'receipt', '2024-02-26 09:15:00', 5);
INSERT INTO expense_item VALUES (11, 9, 150.00, 2, 'per diem', '2024-03-02 10:00:00', 1);
INSERT INTO expense_item VALUES (12, 10, 100.00, 2, 'receipt', '2024-03-04 09:00:00', 2);

-- === REIMBURSEMENT_PAY ===
INSERT INTO reimbursement_pay VALUES (1, 1, '2024-01-16');
INSERT INTO reimbursement_pay VALUES (2, 3, '2024-01-22');
INSERT INTO reimbursement_pay VALUES (3, 4, '2024-01-25');
INSERT INTO reimbursement_pay VALUES (4, 6, '2024-02-22');
INSERT INTO reimbursement_pay VALUES (5, 8, '2024-02-28');
INSERT INTO reimbursement_pay VALUES (6, 9, '2024-03-05');
INSERT INTO reimbursement_pay VALUES (7, 11, '2024-03-14');
INSERT INTO reimbursement_pay VALUES (8, 12, '2024-03-17');

-- === UNIVERSITY_FINANCIAL_SERVICES ===
INSERT INTO university_financial_services VALUES (1, 'Jerry', 'FinanceDept1', 1);
INSERT INTO university_financial_services VALUES (2, 'Bosch', 'FinanceDept2', 2);
INSERT INTO university_financial_services VALUES (3, 'Lisa', 'FinanceDept3', 3);
INSERT INTO university_financial_services VALUES (4, 'Rohit', 'FinanceDept4', 4);
INSERT INTO university_financial_services VALUES (5, 'Mei', 'FinanceDept5', 5);
INSERT INTO university_financial_services VALUES (6, 'Liam', 'FinanceDept6', 6);
INSERT INTO university_financial_services VALUES (7, 'Noah', 'FinanceDept7', 7);
INSERT INTO university_financial_services VALUES (8, 'Emma', 'FinanceDept8', 8);
INSERT INTO university_financial_services VALUES (9, 'Olivia', 'FinanceDept9', 9);
INSERT INTO university_financial_services VALUES (10, 'Ava', 'FinanceDept10', 10);
INSERT INTO university_financial_services VALUES (11, 'Zara', 'FinanceDept11', 11);
INSERT INTO university_financial_services VALUES (12, 'Max', 'FinanceDept12', 12);
