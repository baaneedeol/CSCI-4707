-- 3) Can you tell what doctor give what diagnosis(s) for a visit 
-- and the prescribed treatments for that visit (if any)?
SELECT 
    v.VISITID,
    v.PID,
    d.DIAGNOSISNAME,
    t.TREATMENTNAME,
    doc.EMPLOYEEID AS DOCTORID,
    doc.FNAME AS DOCTOR_FNAME,
    doc.LNAME AS DOCTOR_LNAME
FROM VISIT v
JOIN DIAGNOSIS d ON v.VISITID = d.DIAGNOSISID
LEFT JOIN TREATMENT t ON v.VISITID = t.VISITID
JOIN EMPLOYEE doc ON v.SERVICEPROVIDERID = doc.EMPLOYEEID
WHERE doc.EMPLOYEEID IS NOT NULL;