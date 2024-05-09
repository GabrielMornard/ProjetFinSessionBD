USE Formule1
GO 

CREATE NONCLUSTERED INDEX IX_Ecurie_Nom ON Participations.Ecurie(Nom, Victoire);