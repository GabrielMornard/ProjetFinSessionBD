USE Formule1
GO 

--Création de la table CircuitEvenement dans le schema Evenements
CREATE TABLE Evenements.CircuitEvenement(
	NomCircuit nvarchar(30) NOT NULL,
	Pays nvarchar(30) NOT NULL,
	Ville nvarchar(30) NOT NULL,
	NomEvenement nvarchar(30) NOT NULL,
	Date Datetime Not Null,
)
GO


CREATE PROCEDURE Evenements.usp_CircuitParEvenement
(
	@CircuitID int
)
AS
BEGIN
	SELECT C.Nom AS [NomCircuit], C.Pays, C.Ville, E.Nom AS [NomEvenement], E.Date, C.CircuitId, E.EvenementID
	FROM Evenements.Circuit C
	INNER JOIN Evenements.Evenement E ON E.CircuitId = C.CircuitId
	WHERE C.CircuitId = @CircuitID
END
GO