USE Formule1
GO

CREATE PROCEDURE Participations.USP_ChiffrementTransactions
	@Montant char(30),
	@PiloteId int,
	@EcurieId int
AS
BEGIN

	OPEN SYMMETRIC KEY MaSuperCle
	DECRYPTION BY CERTIFICATE MonCertificat;

	DECLARE @MontantChiffre varbinary(max) = EncryptByKey(KEY_GUID('MaSupercle'), @Montant);

	CLOSE SYMMETRIC KEY MaSuperCle;

	--INSERTION
	INSERT INTO Participations.Transactions (Montant, piloteId, EcurieId)
	VALUES
	(@MontantChiffre, @PiloteId, @EcurieId);
END
GO