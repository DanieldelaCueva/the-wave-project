-- donnees_exemple.sql
-- INSERTS : artistes, groupes et morceaux (noms réels)
-- Paroles : inventées pour protéger les droits d'auteur (début seulement)
-- Données binaires fictives pour imCouverture

-- ===== Roles =====
INSERT INTO Role (idRole, descRole) VALUES
 (1, 'Chanteur'),
 (2, 'Guitariste'),
 (3, 'Batteur'),
 (4, 'Bassiste'),
 (5, 'Claviériste'),
 (6, 'Producteur'),
 (7, 'Parolier'),
 (8, 'Compositeur'),
 (9, 'Saxophoniste'),
 (10, 'DJ');

-- ===== Utilisateurs =====
INSERT INTO Utilisateur (pseudo, mail, mPasse, dInscription) VALUES
 ('user_paris', 'contact.paris@example.fr', '$2y$12$fakehash00000000000000000001', '2021-06-01'),
 ('melody_uk', 'melody.uk@example.co.uk', '$2y$12$fakehash00000000000000000002', '2020-11-11'),
 ('dj_global', 'dj.global@example.com', '$2y$12$fakehash00000000000000000003', '2023-02-02'),
 ('fan_latam', 'fan.latam@example.com', '$2y$12$fakehash00000000000000000004', '2019-09-09'),
 ('listener01', 'listener01@example.net', '$2y$12$fakehash00000000000000000005', '2018-05-05'),
 ('sophie', 'sophie.dupont@example.fr', '$2y$12$fakehash00000000000000000006', '2022-03-03'),
 ('pauluk', 'paul.uk@example.co.uk', '$2y$12$fakehash00000000000000000007', '2024-01-01'),
 ('maria_br', 'maria.br@example.br', '$2y$12$fakehash00000000000000000008', '2022-12-12'),
 ('yuki_jp', 'yuki.jp@example.jp', '$2y$12$fakehash00000000000000000009', '2021-08-08'),
 ('antonio_es', 'antonio.es@example.es', '$2y$12$fakehash00000000000000000010', '2020-04-04');

-- ===== Playlists =====
INSERT INTO Playlist (idPlaylist, titre, descPlaylist, visibilite, dCreation) VALUES
 (1, 'Global Hits', 'Compilation: artistes internationaux', TRUE, '2023-01-01'),
 (2, 'French Touch', 'Titres francophones et influencés', TRUE, '2022-02-02'),
 (3, 'Electronic Nights', 'Beats pour la nuit', TRUE, '2021-03-03'),
 (4, 'Acoustic Calm', 'Morceaux acoustiques', TRUE, '2020-05-05'),
 (5, 'World Tour', 'Rythmes et voix du monde', TRUE, '2019-07-07');

-- ===== Groupes (artistes collectifs ou groupes réels) =====
-- Note: idGroupe correspond à vos FK ; imCouverture = données binaires fictives
INSERT INTO Groupe (idGroupe, nom, dCreation, nationalite, genre, imCouverture) VALUES
 (1, 'The Beatles', '1960-01-01', 'UK', 'Rock', '\\xAAAABB01'::bytea),
 (2, 'Queen', '1970-01-01', 'UK', 'Rock', '\\xAAAABB02'::bytea),
 (3, 'Radiohead', '1985-01-01', 'UK', 'Alternative', '\\xAAAABB03'::bytea),
 (4, 'Coldplay', '1996-01-01', 'UK', 'Pop Rock', '\\xAAAABB04'::bytea),
 (5, 'Daft Punk', '1993-01-01', 'FR', 'Electronic', '\\xAAAABB05'::bytea),
 (6, 'Édith Piaf', '1935-01-01', 'FR', 'Chanson', '\\xAAAABB06'::bytea),
 (7, 'Stromae', '2009-01-01', 'BE', 'Electro/Chanson', '\\xAAAABB07'::bytea),
 (8, 'Beyoncé', '1997-01-01', 'US', 'R&B/Pop', '\\xAAAABB08'::bytea),
 (9, 'Bob Dylan', '1961-01-01', 'US', 'Folk/Rock', '\\xAAAABB09'::bytea),
 (10, 'Nirvana', '1987-01-01', 'US', 'Grunge', '\\xAAAABB0A'::bytea),
 (11, 'Adele', '2006-01-01', 'UK', 'Pop/Soul', '\\xAAAABB0B'::bytea),
 (12, 'Manu Chao', '1998-01-01', 'FR/ES', 'World/Latin', '\\xAAAABB0C'::bytea),
 (13, 'Shakira', '1990-01-01', 'CO', 'Pop/Latin', '\\xAAAABB0D'::bytea),
 (14, 'Buena Vista Social Club', '1996-01-01', 'CU', 'World', '\\xAAAABB0E'::bytea),
 (15, 'M83', '1999-01-01', 'FR', 'Ambient/Electronic', '\\xAAAABB0F'::bytea),
 (16, 'Phoenix', '1999-01-01', 'FR', 'Indie Pop', '\\xAAAABB10'::bytea),
 (17, 'Air', '1995-01-01', 'FR', 'Electronic/Chill', '\\xAAAABB11'::bytea),
 (18, 'Jean-Michel Jarre', '1970-01-01', 'FR', 'Electronic', '\\xAAAABB12'::bytea),
 (19, 'Justice', '2003-01-01', 'FR', 'Electronic', '\\xAAAABB13'::bytea),
 (20, 'Sade', '1982-01-01', 'UK', 'Soul/Jazz', '\\xAAAABB14'::bytea);

-- ===== Artistes (principaux, réels) =====
-- idArtiste correspond aux FK ; imCouverture données binaires fictives
INSERT INTO Artiste (idArtiste, nom, prenom, nationalite, dNaissance, dMort, imCouverture) VALUES
 (1, 'Lennon', 'John', 'UK', '1940-10-09', '1980-12-08', '\\xB10001'::bytea),
 (2, 'McCartney', 'Paul', 'UK', '1942-06-18', NULL, '\\xB10002'::bytea),
 (3, 'Freddie', 'Mercury', 'UK', '1946-09-05', '1991-11-24', '\\xB10003'::bytea),
 (4, 'Thom', 'Yorke', 'UK', '1968-10-07', NULL, '\\xB10004'::bytea),
 (5, 'Chris', 'Martin', 'UK', '1977-03-02', NULL, '\\xB10005'::bytea),
 (6, 'Guy-Manuel', 'de Homem-Christo', 'FR', '1974-02-08', NULL, '\\xB10006'::bytea),
 (7, 'Thomas', 'Bangalter', 'FR', '1975-01-03', NULL, '\\xB10007'::bytea),
 (8, 'Piaf', 'Édith', 'FR', '1915-12-19', '1963-10-10', '\\xB10008'::bytea),
 (9, 'Stromae', 'Paul', 'BE', '1985-03-12', NULL, '\\xB10009'::bytea),
 (10, 'Beyoncé', 'Giselle', 'US', '1981-09-04', NULL, '\\xB1000A'::bytea),
 (11, 'Bob', 'Dylan', 'US', '1941-05-24', NULL, '\\xB1000B'::bytea),
 (12, 'Kurt', 'Cobain', 'US', '1967-02-20', '1994-04-05', '\\xB1000C'::bytea),
 (13, 'Adele', 'Adkins', 'UK', '1988-05-05', NULL, '\\xB1000D'::bytea),
 (14, 'Manu', 'Chao', 'FR', '1961-06-21', NULL, '\\xB1000E'::bytea),
 (15, 'Shakira', 'Isabel', 'CO', '1977-02-02', NULL, '\\xB1000F'::bytea),
 (16, 'Ibrahim', 'Ferrer', 'CU', '1927-02-20', '2005-08-06', '\\xB10010'::bytea),
 (17, 'Anthony', 'Gonzalez', 'FR', '1977-03-30', NULL, '\\xB10011'::bytea),
 (18, 'Thomas', 'Mars', 'FR', '1976-11-29', NULL, '\\xB10012'::bytea),
 (19, 'Nicolas', 'Godin', 'FR', '1969-01-25', NULL, '\\xB10013'::bytea),
 (20, 'Jean-Michel', 'Jarre', 'FR', '1948-08-24', NULL, '\\xB10014'::bytea),
 (21, 'Xavier', 'de Rosnay', 'FR', '1974-05-02', NULL, '\\xB10015'::bytea),
 (22, 'Sade', 'Adu', 'UK', '1959-01-16', NULL, '\\xB10016'::bytea);

-- ===== Albums (réels ou plausibles liés aux groupes) =====
INSERT INTO Album (idAlbum, titre, dParution, imCouverture, descAlbum) VALUES
 (1, 'Abbey Road', '1969-09-26', '\\xC10001'::bytea, 'Classic album by The Beatles'),
 (2, 'A Night at the Opera', '1975-11-21', '\\xC10002'::bytea, 'Queen landmark album'),
 (3, 'OK Computer', '1997-05-21', '\\xC10003'::bytea, 'Radiohead seminal record'),
 (4, 'Parachutes', '2000-07-10', '\\xC10004'::bytea, 'Coldplay debut album'),
 (5, 'Random Access Memories', '2013-05-17', '\\xC10005'::bytea, 'Daft Punk studio album'),
 (6, 'La Vie en rose (single)', '1946-10-07', '\\xC10006'::bytea, 'Édith Piaf classic'),
 (7, 'Racine Carrée', '2013-08-16', '\\xC10007'::bytea, 'Stromae milestone'),
 (8, 'Lemonade', '2016-04-23', '\\xC10008'::bytea, 'Beyoncé album'),
 (9, 'Blood on the Tracks', '1975-01-20', '\\xC10009'::bytea, 'Bob Dylan classic'),
 (10, 'Nevermind', '1991-09-24', '\\xC1000A'::bytea, 'Nirvana breakthrough'),
 (11, '21', '2011-01-24', '\\xC1000B'::bytea, 'Adele global success'),
 (12, 'Clandestino', '1998-01-01', '\\xC1000C'::bytea, 'Manu Chao solo work'),
 (13, 'Laundry Service', '2001-11-13', '\\xC1000D'::bytea, 'Shakira international breakthrough'),
 (14, 'Buena Vista Social Club', '1997-09-16', '\\xC1000E'::bytea, 'Revival of Cuban music'),
 (15, 'Hurry Up, We\'re Dreaming', '2011-10-18', '\\xC1000F'::bytea, 'M83 expansive album'),
 (16, 'Wolfgang Amadeus Phoenix', '2009-05-25', '\\xC10010'::bytea, 'Phoenix award-winning album'),
 (17, 'Moon Safari', '1998-01-01', '\\xC10011'::bytea, 'Air signature album'),
 (18, 'Oxygène', '1976-12-05', '\\xC10012'::bytea, 'Jean-Michel Jarre electronic classic'),
 (19, 'Cross', '2007-11-06', '\\xC10013'::bytea, 'Justice debut'),
 (20, 'Diamond Life', '1984-07-16', '\\xC10014'::bytea, 'Sade debut');

-- ===== Morceaux (60) : titres réels, paroles inventées (début seulement) =====
-- Important: paroles entièrement originales, uniquement 1-2 lignes de début
INSERT INTO Morceau (idMorceau, titre, dureeMorceau, dPublication, paroles) VALUES
 (1, 'Come Together', '00:04:20'::interval, '1969-10-06', 'Walk in the shadows, I tie my shoes...'),
 (2, 'Something', '00:03:03'::interval, '1969-10-06', 'A light that trembles on the shore...'),
 (3, 'Bohemian Rhapsody', '00:05:55'::interval, '1975-10-31', 'A fragile voice that breaks the night...'),
 (4, 'Love of My Life', '00:03:39'::interval, '1975-11-21', 'I hold the thread of a memory bright...'),
 (5, 'Paranoid Android', '00:06:23'::interval, '1997-05-21', 'Gears turning in my dreaming head...'),
 (6, 'Karma Police', '00:04:21'::interval, '1997-08-24', 'Sirens call the winding road behind...'),
 (7, 'Yellow', '00:04:29'::interval, '2000-06-26', 'Sun spills like honey on the street...'),
 (8, 'The Scientist', '00:05:09'::interval, '2002-11-04', 'Broken notes and softer light of dawn...'),
 (9, 'Get Lucky', '00:06:09'::interval, '2013-04-19', 'Neon nights with lucky steps and beats...'),
 (10, 'Instant Crush', '00:05:37'::interval, '2013-05-17', 'Static in the air, a glance, a spark...'),
 (11, 'La Vie en rose', '00:03:20'::interval, '1946-10-07', 'Le matin porte une lueur rose...'),
 (12, 'Non, je ne regrette rien', '00:03:23'::interval, '1960-11-06', 'Pas de regrets, je tourne la page...'),
 (13, 'Papaoutai', '00:03:50'::interval, '2013-05-13', 'Où es-tu, papa, quand le vent se lève...'),
 (14, 'Formidable', '00:03:27'::interval, '2013-11-15', 'Les pas résonnent, visage dans la pluie...'),
 (15, 'If I Were a Boy', '00:04:34'::interval, '2008-10-14', 'Walking in another set of shoes tonight...'),
 (16, 'Halo', '00:03:44'::interval, '2008-01-20', 'A light that circles like a halo bright...'),
 (17, 'Tangled Up in Blue', '00:05:40'::interval, '1975-01-17', 'On the road, the sky folds like old maps...'),
 (18, 'Like a Rolling Stone', '00:06:13'::interval, '1965-07-20', 'Nothing holds the rolling heart tonight...'),
 (19, 'Smells Like Teen Spirit', '00:05:01'::interval, '1991-09-10', 'Fuzzed guitars and a shout in the fog...'),
 (20, 'Come as You Are', '00:03:39'::interval, '1992-03-02', 'Water drips from the mirror of the room...'),
 (21, 'Rolling in the Deep', '00:03:48'::interval, '2010-11-29', 'Deep waters wake with a cry at dawn...'),
 (22, 'Someone Like You', '00:04:45'::interval, '2011-01-24', 'I traced your name across the glass this morn...'),
 (23, 'Clandestino', '00:03:03'::interval, '1998-01-01', 'Caminos cruzan bajo un sol disperso...'),
 (24, 'Bongo Bong', '00:03:20'::interval, '1998-09-15', 'Drums and voices call along the street...'),
 (25, 'Whenever, Wherever', '00:03:17'::interval, '2001-11-12', 'Mountain winds and river bends call you...'),
 (26, 'Hips Don\'t Lie', '00:03:38'::interval, '2005-02-28', 'A step that tells the story of the night...'),
 (27, 'Chan Chan', '00:04:56'::interval, '1996-09-16', 'Old town bells and a wooden cart roll by...'),
 (28, 'El Cuarto de Tula', '00:04:12'::interval, '1996-09-16', 'Voices swell like waves against the shore...'),
 (29, 'Midnight City', '00:04:03'::interval, '2011-08-16', 'City lights like stars spill on the road...'),
 (30, 'Wait', '00:03:51'::interval, '2011-10-18', 'Hold the breath before the sound takes off...'),
 (31, '1901', '00:04:29'::interval, '2009-05-19', 'A youthful shout beneath the neon sky...'),
 (32, 'Lisztomania', '00:04:06'::interval, '2009-06-15', 'Hands clap and feet collide in dance...'),
 (33, 'Sexy Boy', '00:05:00'::interval, '1998-03-16', 'Soft waves and a whisper of perfume...'),
 (34, 'All I Need', '00:04:28'::interval, '1998-01-01', 'Piano opens a crack of morning light...'),
 (35, 'Oxygène Part IV', '00:07:11'::interval, '1976-12-05', 'Rising pads like tides in open air...'),
 (36, 'D.A.N.C.E.', '00:04:10'::interval, '2007-06-27', 'Colors flash and the crowd responds...'),
 (37, 'Smooth Operator', '00:04:15'::interval, '1984-09-13', 'Velvet voice that slides across the room...'),
 (38, 'A Day in the Life', '00:05:34'::interval, '1967-05-26', 'Morning paper, a line across the page...'),
 (39, 'Fix You', '00:04:55'::interval, '2005-09-05', 'Lights that fall, and hands that try to mend...'),
 (40, 'One', '00:04:36'::interval, '1991-10-13', 'Shadows join as one beneath the stage...'),
 (41, 'Yellow Submarine', '00:02:40'::interval, '1966-08-05', 'Beneath the waves a tiny town sings...'),
 (42, 'Under Pressure', '00:04:08'::interval, '1981-10-26', 'Weighing down the shoulders of the day...'),
 (43, 'Karma Police (alt)', '00:04:07'::interval, '1997-08-24', 'Quiet footsteps and a distant hum...'),
 (44, 'Get Lucky (alt)', '00:06:08'::interval, '2013-04-19', 'The night slips on glittered shoes...'),
 (45, 'Someone Like You (live)', '00:05:02'::interval, '2011-06-01', 'A single piano, a hush across the hall...'),
 (46, 'Neon Lights (remix)', '00:05:10'::interval, '2018-09-01', 'Reverb blooms like rain on glass...'),
 (47, 'Boulevard of Broken Dreams', '00:04:20'::interval, '2004-03-14', 'Streetlamps flicker on the empty road...'),
 (48, 'Viva La Vida', '00:04:02'::interval, '2008-05-25', 'Flags that fall in golden afternoon...'),
 (49, 'Clocks', '00:05:07'::interval, '2002-03-24', 'Ticking heart inside the city core...'),
 (50, 'Hysteria', '00:03:47'::interval, '1987-10-27', 'Guitars that tighten like a wound...'),
 (51, 'Everything in Its Right Place', '00:04:09'::interval, '2000-10-10', 'Circuits hum to a steady beat...'),
 (52, 'Lucky Man', '00:03:42'::interval, '1970-11-01', 'Quiet roads and a pocket of coins...'),
 (53, 'Rehab', '00:03:34'::interval, '2006-10-23', 'I said no, but the sky said wait...'),
 (54, 'Hurt', '00:03:58'::interval, '1994-08-23', 'Broken mirrors and a quieter breath...'),
 (55, 'Set Fire to the Rain', '00:04:02'::interval, '2011-01-24', 'Flames that mirror the falling drops...'),
 (56, 'La Camisa Negra', '00:03:32'::interval, '2005-03-07', 'A shirt folds, a grin that hides the night...'),
 (57, 'Porcelain', '00:04:10'::interval, '2000-07-07', 'Fragile bowls and slow afternoon light...'),
 (58, 'Nightcall', '00:04:18'::interval, '2010-12-13', 'Car lights cut a ribbon through the fog...'),
 (59, 'Safe and Sound', '00:03:14'::interval, '2012-12-12', 'A quiet breath within the storm of lights...'),
 (60, 'Digital Love', '00:04:58'::interval, '2001-03-13', 'Pixels form an outline of your face...');

-- ===== Compose (quelques exemples liant morceaux à albums) =====
INSERT INTO Compose (idMorceau, idAlbum, ordreDsAlbum) VALUES
 (1, 1, 1),
 (2, 1, 2),
 (38, 1, 3),
 (3, 2, 11),
 (4, 2, 5),
 (5, 5, 1),
 (9, 5, 4),
 (11, 6, 1),
 (12, 6, 2),
 (13, 7, 3),
 (14, 7, 4),
 (15, 8, 2),
 (16, 8, 3),
 (17, 9, 1),
 (18, 9, 2),
 (19, 10, 1),
 (20, 10, 2),
 (21, 11, 1),
 (22, 11, 2),
 (23, 12, 1),
 (24, 12, 2),
 (25, 13, 1),
 (26, 13, 2),
 (27, 14, 1),
 (28, 14, 2),
 (29, 15, 1),
 (30, 15, 2),
 (31, 16, 1),
 (32, 16, 2),
 (33, 17, 1),
 (34, 17, 2),
 (35, 18, 1),
 (36, 19, 1),
 (37, 20, 1),
 (39, 4, 5),
 (40, 10, 3),
 (41, 1, 4),
 (42, 2, 6),
 (43, 3, 7),
 (44, 5, 5),
 (45, 11, 3),
 (46, 15, 3),
 (47, 16, 4),
 (48, 21, 1),
 (49, 4, 2),
 (50, 32, 3),
 (51, 3, 2),
 (52, 33, 1),
 (53, 34, 1),
 (54, 35, 1),
 (55, 11, 5),
 (56, 13, 4),
 (57, 17, 3),
 (58, 15, 2),
 (59, 26, 1),
 (60, 5, 2);

-- ===== Publie (groupes -> albums) =====
INSERT INTO Publie (idGroupe, idAlbum) VALUES
 (1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
 (6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
 (11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
 (16, 16), (17, 17), (18, 18), (19, 19), (20, 20),
 (4, 21), (3, 22), (5, 23), (2, 24), (1, 25);

-- ===== Joue (groupes jouant des morceaux) =====
INSERT INTO Joue (idGroupe, idMorceau) VALUES
 (1,1),(1,2),(2,3),(2,4),(3,5),(3,6),(4,7),(4,8),
 (5,9),(5,10),(6,11),(6,12),(7,13),(7,14),(8,15),(8,16),
 (9,17),(9,18),(10,19),(10,20),(11,21),(11,22),(12,23),(12,24),
 (13,25),(13,26),(14,27),(14,28),(15,29),(15,30),(16,31),(16,32),
 (17,33),(17,34),(18,35),(19,36),(20,37),(1,38),(4,39),(10,40);

-- ===== Participe (artistes -> morceaux) =====
INSERT INTO Participe (idArtiste, idMorceau) VALUES
 (1,1),(2,2),(3,3),(3,4),(4,5),(4,6),(5,7),(5,8),
 (6,9),(7,10),(8,11),(8,12),(9,13),(9,14),(10,15),(10,16),
 (11,17),(11,18),(12,19),(12,20),(13,21),(13,22),(14,23),(14,24),
 (15,25),(15,26),(16,27),(16,28),(17,29),(17,30),(18,31),(18,32),
 (19,33),(19,34),(20,35),(21,36),(22,37),(2,38),(5,39),(10,40),
 (13,45),(11,21),(3,42),(6,44),(7,13),(14,23);

-- ===== Appartient (artiste -> groupe -> rôle) =====
-- dates fictives afin de respecter la contrainte dateCoherente
INSERT INTO Appartient (idArtiste, idGroupe, idRole, dDebut, dFin) VALUES
 (1, 1, 1, '1960-01-01', '1970-12-31'),
 (2, 1, 1, '1960-01-01', NULL),
 (3, 2, 1, '1970-01-01', '1991-11-24'),
 (4, 3, 1, '1985-01-01', NULL),
 (5, 4, 1, '1996-01-01', NULL),
 (6, 5, 2, '1993-01-01', '2021-02-22'),
 (7, 5, 2, '1993-01-01', '2021-02-22'),
 (8, 6, 1, '1935-01-01', '1963-10-10'),
 (9, 7, 1, '2009-01-01', NULL),
 (10, 8, 1, '1997-01-01', NULL),
 (11, 9, 1, '1961-01-01', NULL),
 (12, 10, 1, '1987-01-01', '1994-04-05'),
 (13, 11, 1, '2006-01-01', NULL),
 (14, 12, 1, '1998-01-01', NULL),
 (15, 13, 1, '1990-01-01', NULL),
 (16, 14, 1, '1996-01-01', '2005-08-06'),
 (17, 15, 1, '1999-01-01', NULL),
 (18, 16, 1, '1999-01-01', NULL),
 (19, 17, 2, '1995-01-01', NULL),
 (20, 18, 1, '1970-01-01', NULL);

-- ===== Cree (utilisateur crée playlist) =====
INSERT INTO Cree (pseudo, idPlaylist) VALUES
 ('user_paris', 2), ('melody_uk', 1), ('dj_global', 3), ('fan_latam',5), ('sophie',4);

-- ===== Inclus (playlist -> morceaux) =====
INSERT INTO Inclus (idPlaylist, idMorceau, ordreDsPlaylist) VALUES
 (1,9,1),(1,29,2),(1,21,3),(1,31,4),(1,36,5),
 (2,11,1),(2,12,2),(2,13,3),(2,14,4),(2,41,5),
 (3,5,1),(3,9,2),(3,29,3),(3,58,4),(3,60,5),
 (4,16,1),(4,34,2),(4,57,3),(4,25,4),(4,38,5),
 (5,23,1),(5,27,2),(5,14,3),(5,24,4),(5,28,5);

-- ===== Ecoute (utilisateurs écoutent des morceaux) =====
INSERT INTO Ecoute (pseudo, idMorceau, dureeEcoute, dateEcoute) VALUES
 ('user_paris',9,'00:04:30'::interval,'2024-06-01 21:10:00'),
 ('melody_uk',1,'00:04:20'::interval,'2024-06-02 09:05:00'),
 ('dj_global',5,'00:06:09'::interval,'2024-06-03 02:00:00'),
 ('fan_latam',23,'00:03:03'::interval,'2024-05-20 18:20:00'),
 ('listener01',31,'00:04:29'::interval,'2024-05-21 12:00:00'),
 ('sophie',11,'00:03:20'::interval,'2024-05-22 08:30:00'),
 ('pauluk',29,'00:04:03'::interval,'2024-05-23 23:45:00'),
 ('maria_br',27,'00:04:56'::interval,'2024-05-24 20:10:00'),
 ('yuki_jp',58,'00:04:18'::interval,'2024-05-25 01:05:00'),
 ('antonio_es',24,'00:03:20'::interval,'2024-05-26 15:15:00');

-- ===== SuitUtilisateur (quelques suivis) =====
INSERT INTO SuitUtilisateur (suivant, suivi, dDebut, dFin) VALUES
 ('melody_uk','user_paris','2023-01-01',NULL),
 ('dj_global','melody_uk','2022-05-05',NULL),
 ('fan_latam','maria_br','2021-07-07',NULL);

-- ===== SuitGroupe (utilisateur suit groupe) =====
INSERT INTO SuitGroupe (pseudo, idGroupe, dDebut, dFin) VALUES
 ('user_paris',5,'2023-02-02',NULL),
 ('melody_uk',1,'2020-01-01',NULL),
 ('dj_global',19,'2021-06-06',NULL);