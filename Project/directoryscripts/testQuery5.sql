SELECT 
AM.PID AS PatiendID,
AM.GuardianID AS GuardianID,
PG.FName AS GuardianFName,
PG.LName AS GuardianLName,
AM.TreatmentID AS TreatmentID, 
   T.TreatmentName AS TreatmentName,
	AM.VisitID AS VisitID
FROM
    APPROVE_MINOR AM
JOIN PARENT_GUARDIAN PG ON AM.GuardianID = PG.GuardianID
JOIN TREATMENT T ON AM.TreatmentID = T.TreatmentID;
