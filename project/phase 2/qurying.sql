SELECT * FROM travel_authorization WHERE auth_date < start_date;

SELECT r.request_id, SUM(e.amount) AS total_expense
FROM travel_expense_report r
JOIN expense_item e ON r.request_id = e.request_id
GROUP BY r.request_id;

SELECT * FROM travel_expense_report WHERE status = 'Approved';

SELECT * FROM expense_item WHERE payment_method IN ('per diem', 'receipt');

SELECT * FROM travel_vendor WHERE service_type = 'Personal Vehicle';

SELECT * FROM reimbursement_pay;

SELECT * FROM travel_expense_report 
WHERE employee_id = 103 AND submission_date BETWEEN '2024-01-01' AND '2024-01-31';

SELECT r.* 
FROM reimbursement_pay r
JOIN travel_expense_report t ON r.request_id = t.request_id
JOIN traveler tr ON t.employee_id = tr.employee_id
WHERE tr.department = 'Finance';

-- db requirements check
-- checking for 10 trips by 5 individuals : How many trips per individual:
SELECT employee_id, COUNT(*) AS trip_count 
FROM travel_authorization GROUP BY employee_id;

-- 2+ transport types used
-- Count transport types used in reports:
SELECT DISTINCT service_type FROM travel_vendor;

-- 2+ department administrators
-- Check supervisor and budget officer counts
SELECT COUNT(*) FROM supervisior;
SELECT COUNT(*) FROM bgt_officer;

