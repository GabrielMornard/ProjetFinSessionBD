USE Formule1
GO 

CREATE TABLE Images.Image(
	ImageID int Identity(1,1),
	EcurieID int NOT NULL,
	Identifiant uniqueidentifier NOT NULL ROWGUIDCOL,
	CONSTRAINT PK_Image_ImageID PRIMARY KEY (ImageID)
)

ALTER TABLE Images.Image ADD CONSTRAINT UC_Image_Identifiant
UNIQUE (Identifiant);
GO

ALTER TABLE Images.Image ADD CONSTRAINT DF_Image_Identifiant
DEFAULT newid() FOR Identifiant;
GO

ALTER TABLE Images.Image ADD
FichierImage varbinary(max) FILESTREAM NULL;
GO

ALTER TABLE Images.Image ADD CONSTRAINT FK_Image_EcurieID
FOREIGN KEY (EcurieID) 
REFERENCES Participations.Ecurie (EcurieID)

INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 21, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\Alta.png', SINGLE_BLOB) AS myfile

INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 22, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\Logo_Manor_F1.png', SINGLE_BLOB) AS myfile

	INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 23, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\virgin.png', SINGLE_BLOB) AS myfile

	INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 24, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\Caterham.jpg', SINGLE_BLOB) AS myfile

	INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 25, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\Canadian.png', SINGLE_BLOB) AS myfile

	INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 26, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\sauber.png', SINGLE_BLOB) AS myfile

	INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 27, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\hrt.png', SINGLE_BLOB) AS myfile

	INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 28, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\McLaren.png', SINGLE_BLOB) AS myfile

	INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 29, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\Renault_F1_Team_logo_2019.png', SINGLE_BLOB) AS myfile

	INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 30, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\Scuderia.png', SINGLE_BLOB) AS myfile

	INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 31, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\Red_Bull_Racing_2022.png', SINGLE_BLOB) AS myfile

	INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 32, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\KurtisKraft.jpg', SINGLE_BLOB) AS myfile

	INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 33, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\LifeRacingEngines.png', SINGLE_BLOB) AS myfile

	INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 34, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\Alfa.png', SINGLE_BLOB) AS myfile

	INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 35, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\force-india.png', SINGLE_BLOB) AS myfile

	INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 36, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\Logo_Williams_F1.png', SINGLE_BLOB) AS myfile

	INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 37, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\lotus.png', SINGLE_BLOB) AS myfile

	INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 38, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\Mercedes.jpg', SINGLE_BLOB) AS myfile

	INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 39, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\Super.png', SINGLE_BLOB) AS myfile

	INSERT INTO Images.Image(EcurieID, FichierImage)
SELECT 30, BulkColumn FROM OPENROWSET (
	BULK 'C:\Users\2239424\Desktop\ProjetFinSessionBD\ProjetFinSessionBD\Images\racingpoint.png', SINGLE_BLOB) AS myfile