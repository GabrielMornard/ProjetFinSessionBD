USE Formule1
GO

CREATE VIEW Participations.vw_GagnatDevenement
AS 
	SELECT E.Nom AS [Nom de l'évênement], C.Nom AS [Circuit], GP.Gagnant AS [Gagnant du GP], ES.Organisation AS [L'organisation], E.EvenementID, GP.GrandPrixID, ES.EvenSpecialID, C.CircuitId
	FROM Evenements.Evenement E
	INNER JOIN Evenements.GrandPrix GP
	ON GP.GrandPrixID = E.GrandPrixId
	INNER JOIN Evenements.EvenementSpecial ES
	ON ES.EvenSpecialID = E.EvenSpecialID
	INNER JOIN Evenements.Circuit C
	ON C.CircuitId = E.CircuitId
GO