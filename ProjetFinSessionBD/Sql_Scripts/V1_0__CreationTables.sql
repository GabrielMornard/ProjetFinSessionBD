--Utilisation de la Base de Données
USE Formule1;
GO

--Création des tables
--Création de la table Evenement dans le schema Evenements
CREATE TABLE Evenements.Evenement(
	EvenementID int IDENTITY(1,1) NOT NULL,
	Nom nvarchar(30) NOT NULL,
	Date Datetime NOT NULL,
	GrandPrixId int NOT NULL,
	EvenSpecialID int NOT NULL,
	CircuitId int NOT NULL,
	CONSTRAINT PK_Evenement_Evenement PRIMARY KEY (EvenementID)
)
GO

--Création de la table GrandPrix dans le Schema Evenements
CREATE TABLE Evenements.GrandPrix(
	GrandPrixID int IDENTITY(1,1) NOT NULL,
	Gagnant nvarchar(30) NOT NULL,
	BilletVendu int NOT NULL,
	Date Datetime NOT NULL,
	CONSTRAINT PK_Evenement_GrandPrix PRIMARY KEY (GrandPrixID)
)
GO

--Création de la table EvenementSpecial dans le Schema Evenements
CREATE TABLE Evenements.EvenementSpecial(
	EvenSpecialID int IDENTITY(1,1) NOT NULL,
	Organisation nvarchar(30) NOT NULL,
	CONSTRAINT PK_Evenement_EvenementSpecial PRIMARY KEY (EvenSpecialID)
)
GO

--Création de la table Circuit dans le Schema Evenements
CREATE TABLE Evenements.Circuit(
	CircuitId int IDENTITY(1,1) NOT NULL,
	Nom nvarchar(30) NOT NULL,
	Pays nvarchar(30) NOT NULL,
	Ville nvarchar(30) NOT NULL,
	CONSTRAINT PK_Evenement_Circuit PRIMARY KEY (CircuitId)
)
GO

--Création de la table Transaction dans le Schema Participations
CREATE TABLE Participations.Transactions(
	TransactionID int IDENTITY(1,1) NOT NULL,
	Montant int NOT NULL,
	piloteId int NOT NULL,
	EcurieId int NOT NULL
	CONSTRAINT PK_Participations_Transaction PRIMARY KEY (TransactionID)
)
GO

-- Création de la table Participation dans le Schema Participations
CREATE TABLE Participations.Participation(
	ParticipationId int IDENTITY(1,1) NOT NULL,
	EcurieID int NOT NULL,
	PiloteID int NOT NULL,
	EvenementID int NOT NUll,
	CONSTRAINT PK_Participation_Participation PRIMARY KEY (ParticipationId)
)
GO

--Création de la table Pilote dans le Schema Participations
CREATE TABLE Participations.Pilote(
	PiloteID int IDENTITY(1,1) NOT NULL,
	Nom nvarchar(30) NOT NULL,
	NBVictoire int NOT NULL,
	EcurieID int NOT NULL,
	Points int NOT NULL,
	CONSTRAINT PK_Participations_Pilote PRIMARY KEY (PiloteID) 
)
GO

--Création de la table Ecurie dans le Schema Participations
CREATE TABLE Participations.Ecurie(
	EcurieID int IDENTITY(1,1) NOT NULL,
	Nom nvarchar(30) NOT NULL,
	Victoire int NOT NULL,
	SponsorID int NULL,
	CONSTRAINT PK_Participations_Ecurie PRIMARY KEY (EcurieID)
)
GO

--Création de la table Sponsor dans le Schema Participations
CREATE TABLE Participations.Sponsor(
	SponsorID int IDENTITY(1,1) NOT NULL,
	Nom nvarchar(30) NOT NULL,
	Budget int NOT NULL,
	CONSTRAINT PK_Participations_Sponsor PRIMARY KEY (SponsorID)
)
GO

--Création de toutes le clées étrangère
--Clée étrangère SponsorID dans la table Participations.Ecurie
ALTER TABLE Participations.Ecurie ADD CONSTRAINT FK_Participations_SponsorID
FOREIGN KEY (sponsorID)
REFERENCES Participations.Sponsor(SponsorID)
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

--Clée étrangère Ecurie dans la table Participations.Pilote
ALTER TABLE Participations.Pilote ADD CONSTRAINT FK_Participations_EcurieID
FOREIGN KEY (EcurieID)
REFERENCES Participations.Ecurie(EcurieID)
GO

--Clée étrangère EcurieID dans la table Participations.Participation
ALTER TABLE Participations.Participation ADD CONSTRAINT FK_Participations_EcuriID
FOREIGN KEY (EcurieID)
REFERENCES Participations.Ecurie(EcurieID)
GO

--Clée étrangère PiloteID dans la table Participations.Participation
ALTER TABLE Participations.Participation ADD CONSTRAINT FK_Participations_PiloteID
FOREIGN KEY (PiloteID)
REFERENCES Participations.Pilote(PiloteID)
GO

--Clée étrangère EvenementID dans la table Participations.Participation
ALTER TABLE Participations.Participation ADD CONSTRAINT FK_Participations_EvenementID
FOREIGN KEY (EvenementID)
REFERENCES Evenements.Evenement(EvenementID)
GO

--Clée étrangère GrandPrixID dans la table Evenements.GrandPrix
ALTER TABLE Evenements.GrandPrix ADD CONSTRAINT FK_Evenements_GrandPrixID
FOREIGN KEY (GrandPrixID)
REFERENCES Evenements.GrandPrix(GrandPrixID)
GO

--Clée étrangère EvenSpecialID dans la table Evenements.Evenement
ALTER TABLE Evenements.Evenement ADD CONSTRAINT FK_Evenements_EvenSpecialID
FOREIGN KEY (EvenSpecialID)
REFERENCES Evenements.EvenementSpecial(EvenSpecialID)
GO

--Clée étrangère CircuitID dans la table Evenements.Evenement
ALTER TABLE Evenements.Evenement ADD CONSTRAINT FK_Evenements_CircuitID
FOREIGN KEY (CircuitID)
REFERENCES Evenements.Circuit(CircuitID)
GO