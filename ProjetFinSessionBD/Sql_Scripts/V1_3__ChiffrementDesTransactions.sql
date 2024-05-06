USE Formule1
GO

--Création de la table Transaction dans le Schema Participations
CREATE TABLE Participations.Transactions(
	TransactionID int IDENTITY(1,1) NOT NULL,
	Montant varbinary(max) NOT NULL,
	piloteId int NOT NULL,
	EcurieId int NOT NULL
	CONSTRAINT PK_Participations_Transaction PRIMARY KEY (TransactionID)
)
GO

CREATE TABLE Participations.TransactionsSimplifie(
	TransactionID int NOT NULL,
	Montant char(30) NOT NULL,
	piloteId int NOT NULL,
	EcurieId int NOT NULL
	CONSTRAINT PK_Participations_TransactionsSimplifie PRIMARY KEY (TransactionID)
)
GO

--Clée étrangère PiloteID dans la table Participations.Transactions
ALTER TABLE Participations.Transactions ADD CONSTRAINT FK_Participations_Transactions_PiloteId
FOREIGN KEY (PiloteID)
REFERENCES Participations.Pilote(PiloteID)
GO

--Clée étrangère PiloteID dans la table Participations.Transactions
ALTER TABLE Participations.Transactions ADD CONSTRAINT FK_Participations_Transactions_EcurieID
FOREIGN KEY (EcurieID)
REFERENCES Participations.Ecurie(EcurieID)
GO

--Encryption des données
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

--Décryption des données
CREATE PROCEDURE Participations.USP_DechiffrementTransactions 
	@TransactionId int
AS
BEGIN

	OPEN SYMMETRIC KEY MaSuperCle
	DECRYPTION BY CERTIFICATE MonCertificat;

	DECLARE @EncryptedMontant varbinary(MAX);

    SELECT @EncryptedMontant = Montant FROM Participations.Transactions
    WHERE TransactionId = @TransactionId;

	SELECT TransactionID, CONVERT(char(30), DecryptByKey(@EncryptedMontant)) AS Montant, piloteId, EcurieId
    FROM Participations.Transactions
    WHERE TransactionId = @TransactionId;
	
	CLOSE SYMMETRIC KEY MaSuperCle;
END
GO