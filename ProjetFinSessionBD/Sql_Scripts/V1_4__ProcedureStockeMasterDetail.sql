USE Formule1
GO 
CREATE PROCEDURE Evenements.usp_CircuitParEvenement
(
	@CircuitID int
)
AS
BEGIN
	SELECT C.Nom, C.Pays, C.Ville, E.Nom, E.Date
	FROM Evenements.Circuit C
	INNER JOIN Evenements.Evenement E ON E.CircuitId = C.CircuitId
	WHERE C.CircuitId = @CircuitID
END
GO