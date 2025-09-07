-- 4)  Can the same clerk do the intake for the same patient on different visits?
SELECT 
    v.PID,
    v.INTAKECLERKEMPLOYEEID,
    COUNT(v.VISITID) AS NUM_VISITS
FROM VISIT v
GROUP BY v.PID, v.INTAKECLERKEMPLOYEEID
HAVING COUNT(v.VISITID) > 1;
