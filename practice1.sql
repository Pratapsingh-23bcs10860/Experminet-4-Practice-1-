DROP TABLE IF EXISTS FeePayments;

CREATE TABLE FeePayments (
    payment_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount > 0),
    payment_date DATE NOT NULL
);


-- Part A: Insert Multiple Fee Payments in a Transaction (Atomicity & Durability)


SELECT'Part A';
BEGIN TRANSACTION;


INSERT INTO FeePayments (payment_id, student_name, amount, payment_date) VALUES
(1, 'Ashish', 5000.00, '2024-06-01'),
(2, 'Smaran', 4500.00, '2024-06-02'),
(3, 'Vaibhav', 5500.00, '2024-06-03');

COMMIT;

--state of the table after the successful commit.
SELECT * FROM FeePayments;



-- Part B: Demonstrate ROLLBACK for Failed Payment (Atomicity & Consistency)


SELECT 'Part B';
BEGIN TRANSACTION;

-- This first insert is temporarily successful 
INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (4, 'Kiran', 6000.00, '2024-06-04');



ROLLBACK;
SELECT '--- Part B: Transaction failed and was rolled back. ---';


SELECT * FROM FeePayments;


-- Part C: Simulate Partial Failure and Ensure Consistent State


SELECT ' Part C';
BEGIN TRANSACTION;

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (5, 'Rohan', 5200.00, '2024-06-06');



ROLLBACK;
SELECT '--- Part C: Transaction failed and was rolled back. ---';


SELECT * FROM FeePayments;
