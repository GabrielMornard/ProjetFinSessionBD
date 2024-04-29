USE Formule1
GO

CREATE PROCEDURE Participations.USP_ChiffrementTransactions
	@Montant char(30)
AS
BEGIN

	OPEN SYMMETRIC KEY MaSuperCle
	DECRYPTION BY CERTIFICATE MonCertificat;

	DECLARE @MontantChiffre varbinary(max) = EncryptByKey(KEY_GUID('MaSupercle'), @Montant);

	CLOSE SYMMETRIC KEY MaSuperCle;

	--INSERTION
	INSERT INTO Participation.Transactions (Montant)
	VALUES
	(@MontantChiffre);
END
GO