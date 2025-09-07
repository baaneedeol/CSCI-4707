USE C4707F24S002U1;
INSERT INTO PATIENT (PID, FNAME, MINITIAL, LNAME, ADDR, EMERCONTACT, INSURANCEINFO)
VALUES (1, 'John', 'D', 'Doe', '123 Main St', 'Jane Doe', 'XYZ Insurance'),
       (2, 'Jane', 'D', 'Doe', '456 Main St', 'John Doe', 'ABC Insurance'),
       (3, 'JohnJr', 'D', 'Doe', '123 Main St', 'John Doe', 'XYZ Insurance');
       
INSERT INTO PARENT_GUARDIAN(GUARDIANID, PID, RELATIONTOPATIENT, PHONENO, EMAIL, FNAME, MINITIAL, LNAME)
VALUES (1, 1, 'Father', '651-123-1234', 'johndoe@gmail.com', 'John', 'D', 'Doe');

INSERT INTO HAS_GUARDIAN (PID, GUARDIANID, CUSTODYSTARTDATE)
VALUES (3, 1, '2010-10-24');

INSERT INTO DEPARTMENT (DEPARTMENTID, DEPARTMENTNAME)
VALUES (100, 'General Staff'),
       (200, 'Nurses'),
       (300, 'Service Providers');

INSERT INTO EMPLOYEE (EMPLOYEEID, SSN, DEPARTMENTID, FNAME, MINITIAL, LNAME, HOURLY, SALARIED)
VALUES (201, 123456789, 200, 'Nurse1', 'N', 'Nlname', 10, 200), -- NURSE
	   (202, 134567892, 200, 'Nurse2', 'N', 'Nlname2', 10, 200), -- NURSE
       (101, 145678912, 100, 'AStaff1', 'N', 'Nlname3', 10, 200), -- ADDITIONAL_STAFF
       (102, 156789123, 100, 'AStaff2', 'N', 'Nlname4', 10, 200), -- ADDITIONAL_STAFF
       (301, 167891234, 300, 'Emp1', 'N', 'Nlname5', 10, 200), -- SERVICE_PROVIDER
       (302, 178912345, 300, 'Emp2', 'N', 'Nlname6', 10, 200); -- SERVICE_PROVIDER
       
INSERT INTO ADDITIONAL_STAFF (EMPLOYEEID)
VALUES (101),
	(102);

INSERT INTO NURSE (EMPLOYEEID, NURSINGLICENSE)
VALUES (201, 'license1'),
	(202, 'license1');

INSERT INTO DIAGNOSIS (DIAGNOSISID, DIAGNOSISNAME, ICD_10_CM_CODE)
VALUES (1, 'Cold', 'J10'),
       (2, 'Flu', 'J00');

INSERT INTO VISIT (VISITID, PID, VDATE, VTIME, INTAKECLERKEMPLOYEEID, NURSEEMPLOYEEID, SERVICEPROVIDERID)
VALUES (1, 1, '2024-12-04', '09:00:00', 101, 201, 301),
       (2, 1, '2024-12-05', '10:00:00', 102, 202, 302),
       (7, 3, '2024-12-06', '09:00:00', 101, 201, 301), -- KidJohn visits
       (8, 3, '2024-12-07', '10:00:00', 102, 202, 302),
       (9, 3, '2024-12-08', '11:00:00', 101, 201, 302);

INSERT INTO LOGS (DIAGNOSISID, EMPLOYEEID)
VALUES (1, 301), -- Doctor 301 diagnosed Cold
       (1, 302), -- Doctor 302 diagnosed Cold
       -- (1, 301), -- Doctor 301 diagnosed JohnJr w Cold 
       -- (1, 302), -- Doctor 302 diagnosed JohnJr w Cold
       (2, 302); -- Doctor 302 diagnosed JohnJr w Fever

-- Insert data for query 2
-- INSERT INTO VISIT (VISITID, PID, VDATE, VTIME)
-- VALUES (3, 2, '2024-12-01', '9:00'), 
-- 	(4, 2, '2024-12-02', '12:00'); -- entered two different visits for same patientID 2
        
INSERT INTO TREATMENT (TREATMENTID, TREATMENTNAME, VISITID)
VALUES (9999, 'Medication', 3), -- put data for one visit id, treatment id must be unique
	(9998, 'Medication', 4); -- put same treatment data for different visit id

-- Test Query 4 Insert Data 
-- Add more patients
INSERT INTO PATIENT (PID, FNAME, MINITIAL, LNAME, ADDR, EMERCONTACT, INSURANCEINFO)
VALUES 
(4, 'Alice', 'M', 'Doe', '456 Elm St', 'Bob Doe', 'ABC Insurance'),
(5, 'Charlie', 'K', 'Doe', '789 Pine St', 'Dana Doe', 'DEF Insurance');

-- Add more departments
INSERT INTO DEPARTMENT (DEPARTMENTID, DEPARTMENTNAME)
VALUES 
(400, 'Admin');

-- Add more employees
INSERT INTO EMPLOYEE (EMPLOYEEID, SSN, DEPARTMENTID, FNAME, MINITIAL, LNAME, HOURLY, SALARIED)
VALUES 
(103, 189123456, 400, 'Admin1', 'A', 'Alast', 15, 300), -- Admin
(104, 190234567, 400, 'Admin2', 'A', 'Blast', 15, 300); -- Admin

-- Add more visits to ensure multiple visits for same PID and INTAKECLERKEMPLOYEEID
INSERT INTO VISIT (VISITID, PID, VDATE, VTIME, INTAKECLERKEMPLOYEEID, NURSEEMPLOYEEID, SERVICEPROVIDERID)
VALUES 
(3, 1, '2024-12-06', '11:00:00', 101, 201, 301), -- Repeat PID 1, Clerk 101
(4, 1, '2024-12-07', '12:00:00', 101, 202, 302), -- Repeat PID 1, Clerk 101
(5, 2, '2024-12-08', '09:00:00', 102, 201, 301), -- New PID 2
(6, 2, '2024-12-09', '10:00:00', 102, 202, 302); -- Repeat PID 2, Clerk 102

-- Add more treatments to link visits to specific procedures
INSERT INTO TREATMENT (TREATMENTID, TREATMENTNAME, VISITID)
VALUES 
(10000, 'Medication', 7), -- Treatment 9999 for Visit 7
(10001, 'Therapy', 8);    -- Treatment 9998 for Visit 8

-- Add more approvals to ensure guardians authorized specific treatments
INSERT INTO APPROVE_MINOR (GUARDIANID, TREATMENTID, VISITID, PID, DIGITALSIGNATURE,HARDCOPYSIG)
VALUES 
(1, 10000, 7, 3, 1, 0), -- Authorization for Medication on Visit 7 by John
(1, 10001, 8, 3, 1, 1); -- Authorization for Therapy on Visit 8 by John
