USE Formule1
GO

CREATE VIEW Participations.vw_EcurieEtPilote 
AS
	SELECT E.Nom AS [NomEcurie], P.Nom AS [NomPilote], P.Points, P.NBVictoire, E.EcurieID, P.PiloteID
	FROM Participations.Ecurie E
	INNER JOIN Participations.Pilote P ON P.EcurieID = E.EcurieID
GO