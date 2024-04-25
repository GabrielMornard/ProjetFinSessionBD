﻿USE[Formule1]
GO
SET IDENTITY_INSERT [Evenements].[EvenementSpecial] ON

INSERT[Evenements].[EvenementSpecial] ([EvenSpecialID], [Organisation]) VALUES(1, N'Formula One Experience')
INSERT[Evenements].[EvenementSpecial]([EvenSpecialID], [Organisation]) VALUES(2, N'Trackside Events Ltd.')
INSERT[Evenements].[EvenementSpecial]([EvenSpecialID], [Organisation]) VALUES(3, N'Raceway Events Ltd.')
INSERT[Evenements].[EvenementSpecial]([EvenSpecialID], [Organisation]) VALUES(4, N'Formula One Productions')
INSERT[Evenements].[EvenementSpecial]([EvenSpecialID], [Organisation]) VALUES(5, N'Trackside Events Ltd.')
INSERT[Evenements].[EvenementSpecial]([EvenSpecialID], [Organisation]) VALUES(6, N'Race Day Organizers')
INSERT[Evenements].[EvenementSpecial]([EvenSpecialID], [Organisation]) VALUES(7, N'Trackside Events Ltd.')
INSERT[Evenements].[EvenementSpecial]([EvenSpecialID], [Organisation]) VALUES(8, N'Formula One Productions')
INSERT[Evenements].[EvenementSpecial]([EvenSpecialID], [Organisation]) VALUES(9, N'Grand Prix Organizers')
INSERT[Evenements].[EvenementSpecial]([EvenSpecialID], [Organisation]) VALUES(10, N'Race Events Inc.')
INSERT[Evenements].[EvenementSpecial]([EvenSpecialID], [Organisation]) VALUES(11, N'Formula One Experience')
INSERT[Evenements].[EvenementSpecial]([EvenSpecialID], [Organisation]) VALUES(12, N'Formula One Productions')
INSERT[Evenements].[EvenementSpecial]([EvenSpecialID], [Organisation]) VALUES(13, N'Speed Circuit Management')
INSERT[Evenements].[EvenementSpecial]([EvenSpecialID], [Organisation]) VALUES(14, N'F1 Spectacular Events')
INSERT[Evenements].[EvenementSpecial]([EvenSpecialID], [Organisation]) VALUES(15, N'Race Events Inc.')
INSERT[Evenements].[EvenementSpecial]([EvenSpecialID], [Organisation]) VALUES(16, N'Race Day Organizers')
INSERT[Evenements].[EvenementSpecial]([EvenSpecialID], [Organisation]) VALUES(17, N'Race Day Organizers')
INSERT[Evenements].[EvenementSpecial]([EvenSpecialID], [Organisation]) VALUES(18, N'Formula One Productions')
INSERT[Evenements].[EvenementSpecial]([EvenSpecialID], [Organisation]) VALUES(19, N'Raceway Events Ltd.')
INSERT[Evenements].[EvenementSpecial]([EvenSpecialID], [Organisation]) VALUES(20, N'Grand Prix Organizers')
SET IDENTITY_INSERT[Evenements].[EvenementSpecial] OFF
GO
SET IDENTITY_INSERT [Evenements].[Circuit] ON

INSERT[Evenements].[Circuit] ([CircuitId], [Nom], [Pays], [Ville]) VALUES(1, N'Melbourne Grand Prix Circuit', N'Mexico', N'Dubai')
INSERT[Evenements].[Circuit]([CircuitId], [Nom], [Pays], [Ville]) VALUES(2, N'Monza Circuit', N'Canada', N'Berlin')
INSERT[Evenements].[Circuit]([CircuitId], [Nom], [Pays], [Ville]) VALUES(3, N'Shanghai International Circuit', N'Italy', N'Sydney')
INSERT[Evenements].[Circuit]([CircuitId], [Nom], [Pays], [Ville]) VALUES(4, N'Circuit de Monaco', N'Japan', N'London')
INSERT[Evenements].[Circuit]([CircuitId], [Nom], [Pays], [Ville]) VALUES(5, N'Circuit de Monaco', N'Germany', N'Berlin')
INSERT[Evenements].[Circuit]([CircuitId], [Nom], [Pays], [Ville]) VALUES(6, N'Interlagos Circuit', N'USA', N'Dubai')
INSERT[Evenements].[Circuit]([CircuitId], [Nom], [Pays], [Ville]) VALUES(7, N'Hungaroring Circuit', N'Australia', N'Tokyo')
INSERT[Evenements].[Circuit]([CircuitId], [Nom], [Pays], [Ville]) VALUES(8, N'Red Bull Ring', N'Mexico', N'Rome')
INSERT[Evenements].[Circuit]([CircuitId], [Nom], [Pays], [Ville]) VALUES(9, N'Hockenheimring Circuit', N'Canada', N'Dubai')
INSERT[Evenements].[Circuit]([CircuitId], [Nom], [Pays], [Ville]) VALUES(10, N'Hungaroring Circuit', N'Japan', N'Los Angeles')
INSERT[Evenements].[Circuit]([CircuitId], [Nom], [Pays], [Ville]) VALUES(11, N'Suzuka Circuit', N'Spain', N'Tokyo')
INSERT[Evenements].[Circuit]([CircuitId], [Nom], [Pays], [Ville]) VALUES(12, N'Silverstone Circuit', N'Germany', N'Los Angeles')
INSERT[Evenements].[Circuit]([CircuitId], [Nom], [Pays], [Ville]) VALUES(13, N'Sochi Autodrom', N'Spain', N'Los Angeles')
INSERT[Evenements].[Circuit]([CircuitId], [Nom], [Pays], [Ville]) VALUES(14, N'Melbourne Grand Prix Circuit', N'Mexico', N'Los Angeles')
INSERT[Evenements].[Circuit]([CircuitId], [Nom], [Pays], [Ville]) VALUES(15, N'Circuit Paul Ricard', N'Brazil', N'New York')
INSERT[Evenements].[Circuit]([CircuitId], [Nom], [Pays], [Ville]) VALUES(16, N'Suzuka Circuit', N'Australia', N'Tokyo')
INSERT[Evenements].[Circuit]([CircuitId], [Nom], [Pays], [Ville]) VALUES(17, N'Monaco Circuit', N'Mexico', N'Los Angeles')
INSERT[Evenements].[Circuit]([CircuitId], [Nom], [Pays], [Ville]) VALUES(18, N'Hockenheimring Circuit', N'Australia', N'Los Angeles')
INSERT[Evenements].[Circuit]([CircuitId], [Nom], [Pays], [Ville]) VALUES(19, N'Yas Marina Circuit', N'Germany', N'Moscow')
INSERT[Evenements].[Circuit]([CircuitId], [Nom], [Pays], [Ville]) VALUES(20, N'Circuit de Monaco', N'Australia', N'Dubai')
SET IDENTITY_INSERT[Evenements].[Circuit] OFF
GO
SET IDENTITY_INSERT [Evenements].[Evenement] ON

INSERT[Evenements].[Evenement] ([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(21, N'Japanese Grand Prix', CAST(N'2023-02-24T00:00:00.000' AS DateTime), 11, 20, 11)
INSERT[Evenements].[Evenement]([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(22, N'Mexican Grand Prix', CAST(N'2023-08-07T00:00:00.000' AS DateTime), 7, 17, 12)
INSERT[Evenements].[Evenement]([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(23, N'United States Grand Prix', CAST(N'2023-02-25T00:00:00.000' AS DateTime), 3, 16, 3)
INSERT[Evenements].[Evenement]([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(24, N'French Grand Prix', CAST(N'2023-12-25T00:00:00.000' AS DateTime), 11, 17, 13)
INSERT[Evenements].[Evenement]([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(25, N'United States Grand Prix', CAST(N'2024-01-26T00:00:00.000' AS DateTime), 15, 4, 15)
INSERT[Evenements].[Evenement]([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(26, N'Japanese Grand Prix', CAST(N'2024-01-01T00:00:00.000' AS DateTime), 20, 11, 14)
INSERT[Evenements].[Evenement]([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(27, N'Abu Dhabi Grand Prix', CAST(N'2023-10-03T00:00:00.000' AS DateTime), 8, 14, 9)
INSERT[Evenements].[Evenement]([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(28, N'United States Grand Prix', CAST(N'2024-01-31T00:00:00.000' AS DateTime), 11, 2, 3)
INSERT[Evenements].[Evenement]([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(29, N'Austrian Grand Prix', CAST(N'2023-03-14T00:00:00.000' AS DateTime), 4, 19, 10)
INSERT[Evenements].[Evenement]([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(30, N'Canadian Grand Prix', CAST(N'2023-11-06T00:00:00.000' AS DateTime), 1, 19, 13)
INSERT[Evenements].[Evenement]([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(31, N'Australian Grand Prix', CAST(N'2023-04-26T00:00:00.000' AS DateTime), 6, 10, 8)
INSERT[Evenements].[Evenement]([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(32, N'Japanese Grand Prix', CAST(N'2023-10-10T00:00:00.000' AS DateTime), 6, 15, 14)
INSERT[Evenements].[Evenement]([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(33, N'Italian Grand Prix', CAST(N'2023-11-16T00:00:00.000' AS DateTime), 4, 17, 7)
INSERT[Evenements].[Evenement]([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(34, N'Canadian Grand Prix', CAST(N'2023-10-05T00:00:00.000' AS DateTime), 17, 18, 14)
INSERT[Evenements].[Evenement]([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(35, N'Monaco Grand Prix', CAST(N'2023-03-04T00:00:00.000' AS DateTime), 19, 1, 6)
INSERT[Evenements].[Evenement]([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(36, N'Brazilian Grand Prix', CAST(N'2023-06-24T00:00:00.000' AS DateTime), 10, 10, 10)
INSERT[Evenements].[Evenement]([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(37, N'Belgian Grand Prix', CAST(N'2023-11-04T00:00:00.000' AS DateTime), 20, 18, 3)
INSERT[Evenements].[Evenement]([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(38, N'Austrian Grand Prix', CAST(N'2024-02-01T00:00:00.000' AS DateTime), 12, 19, 2)
INSERT[Evenements].[Evenement]([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(39, N'Belgian Grand Prix', CAST(N'2023-10-01T00:00:00.000' AS DateTime), 13, 6, 6)
INSERT[Evenements].[Evenement]([EvenementID], [Nom], [Date], [GrandPrixId], [EvenSpecialID], [CircuitId]) VALUES(40, N'Monaco Grand Prix', CAST(N'2023-03-16T00:00:00.000' AS DateTime), 13, 3, 14)
SET IDENTITY_INSERT[Evenements].[Evenement] OFF
GO
SET IDENTITY_INSERT [Participations].[Sponsor] ON

INSERT[Participations].[Sponsor] ([SponsorID], [Nom], [Budget]) VALUES(1, N'Chevrolet', 1000000)
INSERT[Participations].[Sponsor]([SponsorID], [Nom], [Budget]) VALUES(2, N'Chevrolet', 2000000)
INSERT[Participations].[Sponsor]([SponsorID], [Nom], [Budget]) VALUES(3, N'Ford', 3000000)
INSERT[Participations].[Sponsor]([SponsorID], [Nom], [Budget]) VALUES(4, N'Verizon', 4000000)
INSERT[Participations].[Sponsor]([SponsorID], [Nom], [Budget]) VALUES(5, N'Pepsi', 5000000)
INSERT[Participations].[Sponsor]([SponsorID], [Nom], [Budget]) VALUES(6, N'Ford', 6000000)
INSERT[Participations].[Sponsor]([SponsorID], [Nom], [Budget]) VALUES(7, N'Budweiser', 7000000)
INSERT[Participations].[Sponsor]([SponsorID], [Nom], [Budget]) VALUES(8, N'Verizon', 8000000)
INSERT[Participations].[Sponsor]([SponsorID], [Nom], [Budget]) VALUES(9, N'Gatorade', 9000000)
INSERT[Participations].[Sponsor]([SponsorID], [Nom], [Budget]) VALUES(10, N'Ford', 10000000)
INSERT[Participations].[Sponsor]([SponsorID], [Nom], [Budget]) VALUES(11, N'Gatorade', 11000000)
INSERT[Participations].[Sponsor]([SponsorID], [Nom], [Budget]) VALUES(12, N'Toyota', 12000000)
INSERT[Participations].[Sponsor]([SponsorID], [Nom], [Budget]) VALUES(13, N'Toyota', 13000000)
INSERT[Participations].[Sponsor]([SponsorID], [Nom], [Budget]) VALUES(14, N'Chevrolet', 14000000)
INSERT[Participations].[Sponsor]([SponsorID], [Nom], [Budget]) VALUES(15, N'Nike', 15000000)
INSERT[Participations].[Sponsor]([SponsorID], [Nom], [Budget]) VALUES(16, N'Gatorade', 16000000)
INSERT[Participations].[Sponsor]([SponsorID], [Nom], [Budget]) VALUES(17, N'Verizon', 17000000)
INSERT[Participations].[Sponsor]([SponsorID], [Nom], [Budget]) VALUES(18, N'Toyota', 18000000)
INSERT[Participations].[Sponsor]([SponsorID], [Nom], [Budget]) VALUES(19, N'Verizon', 19000000)
INSERT[Participations].[Sponsor]([SponsorID], [Nom], [Budget]) VALUES(20, N'Verizon', 20000000)
SET IDENTITY_INSERT[Participations].[Sponsor] OFF
GO
SET IDENTITY_INSERT [Participations].[Ecurie] ON

INSERT[Participations].[Ecurie] ([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(21, N'Virgin', 352, 20)
INSERT[Participations].[Ecurie]([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(22, N'Manor', 730, 19)
INSERT[Participations].[Ecurie]([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(23, N'Virgin', 552, 18)
INSERT[Participations].[Ecurie]([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(24, N'Caterham', 554, 17)
INSERT[Participations].[Ecurie]([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(25, N'McLaren', 951, 16)
INSERT[Participations].[Ecurie]([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(26, N'Sauber', 163, 15)
INSERT[Participations].[Ecurie]([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(27, N'HRT', 677, 14)
INSERT[Participations].[Ecurie]([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(28, N'McLaren', 947, 13)
INSERT[Participations].[Ecurie]([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(29, N'Force India', 649, 12)
INSERT[Participations].[Ecurie]([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(30, N'AlphaTauri', 544, 11)
INSERT[Participations].[Ecurie]([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(31, N'Red Bull', 916, 10)
INSERT[Participations].[Ecurie]([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(32, N'Renault', 715, 9)
INSERT[Participations].[Ecurie]([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(33, N'Force India', 664, 8)
INSERT[Participations].[Ecurie]([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(34, N'Alfa Romeo', 90, 7)
INSERT[Participations].[Ecurie]([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(35, N'Force India', 61, 6)
INSERT[Participations].[Ecurie]([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(36, N'Williams', 764, 5)
INSERT[Participations].[Ecurie]([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(37, N'Lotus', 561, 4)
INSERT[Participations].[Ecurie]([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(38, N'Mercedes', 220, 3)
INSERT[Participations].[Ecurie]([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(39, N'Super Aguri', 251, 2)
INSERT[Participations].[Ecurie]([EcurieID], [Nom], [Victoire], [SponsorID]) VALUES(40, N'Racing Point', 162, 1)
SET IDENTITY_INSERT[Participations].[Ecurie] OFF
GO
SET IDENTITY_INSERT [Participations].[Pilote] ON

INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(102, N'Valtteri Bottas', 15, 38, 151)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(103, N'Daniel Ricciardo', 6, 39, 373)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(104, N'Carlo Abate', 38, 38, 453)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(105, N'Lewis Hamilton', 91, 30, 430)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(106, N'George Abecassis', 82, 21, 178)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(107, N'Kenny Acheson', 55, 32, 195)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(108, N'Andrea de Adamich', 91, 30, 280)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(109, N'Philippe Adams', 16, 37, 253)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(110, N'Charles Leclerc', 7, 23, 225)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(111, N'Walt Ader', 67, 28, 403)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(112, N'Kurt Adolff', 59, 29, 254)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(113, N'Fred Agabashian', 36, 31, 223)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(114, N'Kurt Ahrens Jr.', 91, 23, 274)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(115, N'Jack Aitken', 9, 28, 383)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(116, N'Christijan Alber', 40, 31, 77)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(117, N'Michael Schumacher', 85, 38, 380)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(118, N'Ayrton Senna', 79, 37, 92)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(119, N'Dorino Serafini', 54, 32, 359)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(120, N'Max Verstappen', 47, 22, 313)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(121, N'Tony Settember', 48, 33, 2)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(122, N'Jo Siffert', 66, 29, 351)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(123, N'André Simon', 31, 34, 479)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(124, N'Raymond Sommer', 72, 30, 35)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(125, N'Jackie Stewart', 88, 22, 435)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(126, N'Lance Stroll', 63, 33, 195)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(127, N'Dennis Taylor', 49, 24, 117)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(128, N'John Taylor', 91, 34, 178)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(129, N'Max de Terra', 81, 28, 371)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(130, N'Desmond Titterington', 53, 39, 260)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(131, N'Yuki Tsunoda', 66, 37, 196)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(132, N'Jos Verstappen', 51, 33, 421)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(133, N'Jean-Éric Vergne', 77, 39, 207)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(134, N'Romain Grosjean', 36, 31, 275)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(135, N'Mike Harris', 14, 28, 145)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(136, N'Boy Hayje', 13, 35, 17)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(137, N'Willi Heeks', 50, 38, 252)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(138, N'Gary Hocking', 33, 25, 290)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(139, N'Nico Hülkenberg', 55, 37, 374)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(140, N'Jean-Pierre Jabouille', 28, 37, 377)
INSERT[Participations].[Pilote]([PiloteID], [Nom], [NBVictoire], [EcurieID], [Points]) VALUES(141, N'Alan Jones', 31, 21, 134)
SET IDENTITY_INSERT[Participations].[Pilote] OFF
GO
SET IDENTITY_INSERT [Participations].[Participation] ON

INSERT[Participations].[Participation] ([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(41, 35, 123, 34)
INSERT[Participations].[Participation]([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(42, 34, 102, 31)
INSERT[Participations].[Participation]([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(43, 35, 108, 33)
INSERT[Participations].[Participation]([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(44, 22, 141, 24)
INSERT[Participations].[Participation]([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(45, 33, 138, 37)
INSERT[Participations].[Participation]([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(46, 39, 112, 37)
INSERT[Participations].[Participation]([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(47, 37, 105, 39)
INSERT[Participations].[Participation]([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(48, 28, 105, 36)
INSERT[Participations].[Participation]([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(49, 37, 108, 31)
INSERT[Participations].[Participation]([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(50, 30, 123, 25)
INSERT[Participations].[Participation]([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(51, 25, 107, 31)
INSERT[Participations].[Participation]([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(52, 33, 103, 32)
INSERT[Participations].[Participation]([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(53, 26, 131, 40)
INSERT[Participations].[Participation]([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(54, 35, 103, 35)
INSERT[Participations].[Participation]([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(55, 27, 117, 30)
INSERT[Participations].[Participation]([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(56, 26, 109, 34)
INSERT[Participations].[Participation]([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(57, 30, 125, 31)
INSERT[Participations].[Participation]([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(58, 35, 123, 27)
INSERT[Participations].[Participation]([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(59, 30, 139, 24)
INSERT[Participations].[Participation]([ParticipationId], [EcurieID], [PiloteID], [EvenementID]) VALUES(60, 25, 117, 40)
SET IDENTITY_INSERT[Participations].[Participation] OFF
GO
SET IDENTITY_INSERT [Evenements].[GrandPrix] ON

INSERT[Evenements].[GrandPrix] ([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(1, N'Valtteri Bottas', 10131, CAST(N'2023-12-11T00:00:00.000' AS DateTime))
INSERT[Evenements].[GrandPrix]([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(2, N'Lando Norris', 5814, CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT[Evenements].[GrandPrix]([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(3, N'Yuki Tsunorez', 8593, CAST(N'2023-12-05T00:00:00.000' AS DateTime))
INSERT[Evenements].[GrandPrix]([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(4, N'Sergio Peifi', 10505, CAST(N'2024-03-04T00:00:00.000' AS DateTime))
INSERT[Evenements].[GrandPrix]([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(5, N'Daniel Ricciardo', 8558, CAST(N'2024-03-09T00:00:00.000' AS DateTime))
INSERT[Evenements].[GrandPrix]([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(6, N'Valtteri Bottas', 12115, CAST(N'2024-05-20T00:00:00.000' AS DateTime))
INSERT[Evenements].[GrandPrix]([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(7, N'Antonio Giovinazzi', 12896, CAST(N'2023-09-16T00:00:00.000' AS DateTime))
INSERT[Evenements].[GrandPrix]([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(8, N'Lance Stroll', 9091, CAST(N'2024-03-26T00:00:00.000' AS DateTime))
INSERT[Evenements].[GrandPrix]([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(9, N'Nikita Mazepin', 13177, CAST(N'2024-01-14T00:00:00.000' AS DateTime))
INSERT[Evenements].[GrandPrix]([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(10, N'Lance Stroll', 7506, CAST(N'2023-08-13T00:00:00.000' AS DateTime))
INSERT[Evenements].[GrandPrix]([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(11, N'Nikita Mazepin', 12434, CAST(N'2024-02-29T00:00:00.000' AS DateTime))
INSERT[Evenements].[GrandPrix]([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(12, N'Nikita Mazepin', 13073, CAST(N'2023-11-21T00:00:00.000' AS DateTime))
INSERT[Evenements].[GrandPrix]([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(13, N'Lando Norris', 11937, CAST(N'2024-06-25T00:00:00.000' AS DateTime))
INSERT[Evenements].[GrandPrix]([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(14, N'Fernando Alonso', 5545, CAST(N'2023-12-13T00:00:00.000' AS DateTime))
INSERT[Evenements].[GrandPrix]([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(15, N'Max Verstappen', 13436, CAST(N'2024-05-27T00:00:00.000' AS DateTime))
INSERT[Evenements].[GrandPrix]([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(16, N'Max Verstappen', 5806, CAST(N'2023-09-16T00:00:00.000' AS DateTime))
INSERT[Evenements].[GrandPrix]([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(17, N'Kimi RÃ¤ikkÃ¶nen', 9667, CAST(N'2024-02-11T00:00:00.000' AS DateTime))
INSERT[Evenements].[GrandPrix]([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(18, N'Lance Stroll', 7977, CAST(N'2024-04-09T00:00:00.000' AS DateTime))
INSERT[Evenements].[GrandPrix]([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(19, N'Sebastian Vettel', 14868, CAST(N'2023-08-21T00:00:00.000' AS DateTime))
INSERT[Evenements].[GrandPrix]([GrandPrixID], [Gagnant], [BilletVendu], [Date]) VALUES(20, N'Kimi RÃ¤ikkÃ¶nen', 9669, CAST(N'2024-05-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT[Evenements].[GrandPrix] OFF
GO
