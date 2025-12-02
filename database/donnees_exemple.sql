-- =============================
-- DONNÉES D'EXEMPLE COMPLÈTES
-- =============================

-- -----------------------------
-- 1) UTILISATEURS (10)
-- -----------------------------
INSERT INTO Utilisateur (pseudo, mail, mPasse, dInscription) VALUES
('melomane92', 'melomane92@mail.com', '$pbkdf2-sha256$29000$ZUyp1Xov5fwfw5hTqjWGUA$AXUlrqN1Quf9pgcN51mPvgt4kfSlQcYPz0szJ1FE8Iw', '2023-01-12'),
('rockfan', 'rockfan@mail.com', '$pbkdf2-sha256$29000$NYYQonTuHeN87/3fW8uZkw$kh0c8Fqn7AhnFMUrXp.uCpBnLy3JnhAfidh/i/sIVaY', '2023-03-10'),
('jazzlover', 'jazzlover@mail.com', '$pbkdf2-sha256$29000$SQnBOGcMAaB0TglByNnbew$4/sMWITnTzno.KdcsBp1jVYcMOrir2OrVv66t81SYDY', '2023-05-22'),
('beatlemania', 'beatlemania@mail.com', '$pbkdf2-sha256$29000$F8LYW.v9/38PIURorZXSeg$a92TGhTDWlZ2T51Q.xi8ATuGXJ0okc1FSSin8G1Z4V4', '2023-07-15'),
('vinyl_addict', 'vinyl_addict@mail.com', '$pbkdf2-sha256$29000$W2utlXLO.b.X8n4vRcjZOw$0MNFNSgI01GIVF0iurdBMHtiDD1AKsfIQ2Do4EzR14U', '2023-09-01'),
('electrohead', 'electrohead@mail.com', '$pbkdf2-sha256$29000$FcK4d661Vqp1zrl3jjFmTA$L3glR0xJiOFrvpjY3w4znANEHBAGbrH6/pvhVkXSLes', '2024-02-09'),
('queenfan', 'queenfan@mail.com', '$pbkdf2-sha256$29000$GmPs/Z8TghBirPVeq7UWYg$C2TuiRpfS3PU1Z2FD8tKtMHZSQFlVd9n7lwGMllQfSs', '2024-03-12'),
('classicrock', 'classicrock@mail.com', '$pbkdf2-sha256$29000$lbIWAiCktPb.HyME4Lz3vg$sRcR/.WDSn4KpdDsb9hi1QRuXZmRS2JS81BksuxquN0', '2024-04-01'),
('indie_vibes', 'indie_vibes@mail.com', '$pbkdf2-sha256$29000$VkqptbZ2zhmj1Nr7H4MQYg$8enj2.IOa.OfATLLflfEC3XhJFRnuvTXtllbQ6Pmap0', '2024-06-23'),
('lofi_dreams', 'lofi_dreams@mail.com', '$pbkdf2-sha256$29000$NqY0pvSeU2oN4bwXolSqFQ$U8g9m5VPPgyjsBpkI4q5mNO1fVOyHntDTIG0/Io90BY', '2024-08-30');

-- -----------------------------
-- 2) GROUPES (10)
-- idGroupe assigned by insertion order: 1..10
-- -----------------------------
INSERT INTO Groupe (nom, dCreation, nationalite, genre) VALUES
('The Beatles', '1960-01-01', 'Royaume-Uni', 'Rock'),
('Queen', '1970-01-01', 'Royaume-Uni', 'Rock'),
('Pink Floyd', '1965-01-01', 'Royaume-Uni', 'Progressive Rock'),
('Daft Punk', '1993-01-01', 'France', 'Electro'),
('Coldplay', '1996-01-01', 'Royaume-Uni', 'Alternative Rock'),
('Radiohead', '1985-01-01', 'Royaume-Uni', 'Alternative Rock'),
('Nirvana', '1987-01-01', 'États-Unis', 'Grunge'),
('Led Zeppelin', '1968-01-01', 'Royaume-Uni', 'Hard Rock'),
('Arctic Monkeys', '2002-01-01', 'Royaume-Uni', 'Indie Rock'),
('Imagine Dragons', '2008-01-01', 'États-Unis', 'Pop Rock');

-- -----------------------------
-- 3) ARTISTES (19)
-- idArtiste assigned by insertion order: 1..19
-- -----------------------------
INSERT INTO Artiste (nom, prenom, nationalite, dNaissance, dMort) VALUES
('Lennon', 'John', 'Britannique', '1940-10-09', '1980-12-08'),
('McCartney', 'Paul', 'Britannique', '1942-06-18', NULL),
('Harrison', 'George', 'Britannique', '1943-02-25', '2001-11-29'),
('Starr', 'Ringo', 'Britannique', '1940-07-07', NULL),
('Mercury', 'Freddie', 'Britannique', '1946-09-05', '1991-11-24'),
('May', 'Brian', 'Britannique', '1947-07-19', NULL),
('Taylor', 'Roger', 'Britannique', '1949-07-26', NULL),
('Waters', 'Roger', 'Britannique', '1943-09-06', NULL),
('Gilmour', 'David', 'Britannique', '1946-03-06', NULL),
('Guy-Manuel de Homem-Christo', NULL, 'Français', '1974-02-08', NULL),
('Bangalter', 'Thomas', 'Français', '1975-01-03', NULL),
('Martin', 'Chris', 'Britannique', '1977-03-02', NULL),
('Bellamy', 'Matthew', 'Britannique', '1978-06-09', NULL),
('Yorke', 'Thom', 'Britannique', '1968-10-07', NULL),
('Cobain', 'Kurt', 'Américain', '1967-02-20', '1994-04-05'),
('Plant', 'Robert', 'Britannique', '1948-08-20', NULL),
('Page', 'Jimmy', 'Britannique', '1944-01-09', NULL),
('Turner', 'Alex', 'Britannique', '1986-01-06', NULL),
('Reynolds', 'Dan', 'Américain', '1987-07-14', NULL);

-- -----------------------------
-- 4) ROLE (6)
-- idRole 1..6
-- -----------------------------
INSERT INTO Role (descRole) VALUES
('Chanteur'), ('Guitariste'), ('Batteur'), ('Bassiste'), ('Claviériste'), ('Producteur');

-- -----------------------------
-- 5) APPARTIENT (liens artiste->groupe + rôle + dates)
-- Utilise les idArtiste et idGroupe selon l'ordre d'insertion ci-dessus.
-- -----------------------------
-- The Beatles: artistes 1-4 -> groupe 1
INSERT INTO Appartient (idArtiste, idGroupe, idRole, dDebut, dFin) VALUES
(1, 1, 1, '1960-01-01', '1970-04-10'),
(2, 1, 2, '1960-01-01', '1970-04-10'),
(3, 1, 2, '1960-01-01', '1970-04-10'),
(4, 1, 3, '1960-01-01', '1970-04-10');

-- Queen: artistes 5-7 -> groupe 2
INSERT INTO Appartient (idArtiste, idGroupe, idRole, dDebut) VALUES
(5, 2, 1, '1970-01-01'),
(6, 2, 2, '1970-01-01'),
(7, 2, 3, '1970-01-01');

-- Pink Floyd: Waters (8) & Gilmour (9) -> groupe 3
INSERT INTO Appartient (idArtiste, idGroupe, idRole, dDebut) VALUES
(8, 3, 1, '1965-01-01'),
(9, 3, 2, '1968-01-01');

-- Daft Punk: 10 & 11 -> groupe 4
INSERT INTO Appartient (idArtiste, idGroupe, idRole, dDebut) VALUES
(10, 4, 2, '1993-01-01'),
(11, 4, 1, '1993-01-01');

-- Coldplay: Chris Martin (12) -> groupe 5
INSERT INTO Appartient (idArtiste, idGroupe, idRole, dDebut) VALUES
(12, 5, 1, '1996-01-01');

-- Radiohead: Thom Yorke (14) -> groupe 6
INSERT INTO Appartient (idArtiste, idGroupe, idRole, dDebut) VALUES
(14, 6, 1, '1985-01-01');

-- Nirvana: Kurt Cobain (15) -> groupe 7
INSERT INTO Appartient (idArtiste, idGroupe, idRole, dDebut, dFin) VALUES
(15, 7, 1, '1987-01-01', '1994-04-05');

-- Led Zeppelin: Plant (16) & Page (17) -> groupe 8
INSERT INTO Appartient (idArtiste, idGroupe, idRole, dDebut) VALUES
(16, 8, 1, '1968-01-01'),
(17, 8, 2, '1968-01-01');

-- Arctic Monkeys: Alex Turner (18) -> groupe 9
INSERT INTO Appartient (idArtiste, idGroupe, idRole, dDebut) VALUES
(18, 9, 1, '2002-01-01');

-- Imagine Dragons: Dan Reynolds (19) -> groupe 10
INSERT INTO Appartient (idArtiste, idGroupe, idRole, dDebut) VALUES
(19, 10, 1, '2008-01-01');

-- -----------------------------
-- 6) ALBUMS (12)  -> idAlbum 1..12
-- -----------------------------
INSERT INTO Album (titre, dParution, descAlbum) VALUES
('Abbey Road', '1969-09-26', 'Dernier album enregistré par The Beatles.'),
('A Night at the Opera', '1975-11-21', 'Album emblématique de Queen.'),
('The Dark Side of the Moon', '1973-03-01', 'Chef-d’œuvre de Pink Floyd.'),
('Discovery', '2001-03-12', 'Album culte de Daft Punk.'),
('Parachutes', '2000-07-10', 'Premier album de Coldplay.'),
('OK Computer', '1997-05-21', 'Album majeur de Radiohead.'),
('Nevermind', '1991-09-24', 'Album culte de Nirvana.'),
('Led Zeppelin IV', '1971-11-08', 'Contient "Stairway to Heaven".'),
('AM', '2013-09-09', 'Grand succès des Arctic Monkeys.'),
('Evolve', '2017-06-23', 'Album pop-rock d’Imagine Dragons.'),
('The Wall', '1979-11-30', 'Opéra rock de Pink Floyd.'),
('Random Access Memories', '2013-05-17', 'Dernier album studio de Daft Punk.');

-- -----------------------------
-- 7) MORCEAUX (60 : 12 albums x 5 titres)
-- idMorceau assigned in insertion order 1..60
-- Les 5 premiers -> album 1, etc.
-- -----------------------------
-- Album 1: Abbey Road (1..5)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('Come Together', '00:04:20', '1969-09-26', 'Here come old flat top...'),
('Something', '00:03:03', '1969-09-26', 'Something in the way she moves...'),
('Maxwell''s Silver Hammer', '00:03:27', '1969-09-26', 'Joan was quizzical...'),
('Oh! Darling', '00:03:26', '1969-09-26', 'Oh! Darling, please believe me...'),
('Octopus''s Garden', '00:02:51', '1969-09-26', 'I''d like to be under the sea...');

-- Album 2: A Night at the Opera (6..10)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('Bohemian Rhapsody', '00:05:55', '1975-11-21', 'Is this the real life...'),
('You''re My Best Friend', '00:02:52', '1975-11-21', 'Ooh, you''re my best friend...'),
('Love of My Life', '00:03:38', '1975-11-21', 'Love of my life, you''ve hurt me...'),
('39', '00:03:30', '1975-11-21', 'In the year of 39...'),
('I''m in Love with My Car', '00:03:05', '1975-11-21', 'The machine of a dream...');

-- Album 3: The Dark Side of the Moon (11..15)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('Speak to Me', '00:01:30', '1973-03-01', 'Instrumental opening...'),
('Breathe', '00:02:43', '1973-03-01', 'Breathe, breathe in the air...'),
('Time', '00:07:06', '1973-03-01', 'Ticking away the moments...'),
('Money', '00:06:23', '1973-03-01', 'Money, get away...'),
('Us and Them', '00:07:49', '1973-03-01', 'Us and them...');

-- Album 4: Discovery (16..20)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('One More Time', '00:05:20', '2001-03-12', 'One more time, we''re gonna celebrate...'),
('Digital Love', '00:04:58', '2001-03-12', 'Last night I had a dream about you...'),
('Harder, Better, Faster, Stronger', '00:03:45', '2001-03-12', 'Work it harder, make it better...'),
('Around the World', '00:07:10', '2001-03-12', 'Around the world, around the world...'),
('Face to Face', '00:03:58', '2001-03-12', 'Face to face...');

-- Album 5: Parachutes (21..25)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('Don''t Panic', '00:02:17', '2000-07-10', 'Bones sinking like stones...'),
('Shiver', '00:04:59', '2000-07-10', 'So I look in your direction...'),
('Yellow', '00:04:29', '2000-07-10', 'Look at the stars, look how they shine for you...'),
('Trouble', '00:02:30', '2000-07-10', 'Oh no, I see a man of contradiction now...'),
('Parachutes', '00:04:09', '2000-07-10', 'When we get older, we will be...');

-- Album 6: OK Computer (26..30)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('Airbag', '00:04:44', '1997-05-21', 'In the next world war...'),
('Paranoid Android', '00:06:23', '1997-05-21', 'Please could you stop the noise...'),
('Subterranean Homesick Alien', '00:04:27', '1997-05-21', 'I want to be...'),
('Karma Police', '00:04:24', '1997-05-21', 'Karma police, arrest this man...'),
('No Surprises', '00:03:48', '1997-05-21', 'A heart that''s full up like a landfill...');

-- Album 7: Nevermind (31..35)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('Smells Like Teen Spirit', '00:05:01', '1991-09-24', 'Load up on guns, bring your friends...'),
('In Bloom', '00:04:15', '1991-09-24', 'Sell the kids for food...'),
('Come as You Are', '00:03:39', '1991-09-24', 'Come as you are, as you were...'),
('Breed', '00:03:03', '1991-09-24', 'I don''t care, I don''t mind...'),
('Lithium', '00:04:15', '1991-09-24', 'I''m so happy, ''cause today I found my friends...');

-- Album 8: Led Zeppelin IV (36..40)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('Black Dog', '00:04:55', '1971-11-08', 'Hey hey mama said the way you move...'),
('Rock and Roll', '00:03:40', '1971-11-08', 'It''s been a long time since I rock and rolled...'),
('The Battle of Evermore', '00:05:51', '1971-11-08', 'The queen of light took her bow...'),
('Stairway to Heaven', '00:08:02', '1971-11-08', 'There''s a lady who''s sure all that glitters is gold...'),
('Going to California', '00:03:32', '1971-11-08', 'Spent my days with a woman unkind...');

-- Album 9: AM (41..45)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('Do I Wanna Know?', '00:04:32', '2013-09-09', 'Have you got color in your cheeks?'),
('R U Mine?', '00:03:21', '2013-09-09', 'I go crazy '',''cause here isn''t where I wanna be...'),
('One for the Road', '00:04:16', '2013-09-09', 'One for the road, and one for the show...'),
('Arabella', '00:03:27', '2013-09-09', 'Arabella is a witch who comes to me...'),
('I Wanna Be Yours', '00:03:03', '2013-09-09', 'I wanna be your vacuum cleaner...');

-- Album 10: Evolve (46..50)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('I Don''t Know Why', '00:03:12', '2017-06-23', 'I don''t know why I love you...'),
('Whatever It Takes', '00:03:21', '2017-06-23', 'Falling too fast to prepare for this...'),
('Believer', '00:03:24', '2017-06-23', 'First things first I''ma say all the words inside my head...'),
('Thunder', '00:03:07', '2017-06-23', 'Just a young gun with a quick fuse...'),
('Rise Up', '00:03:40', '2017-06-23', 'Rise up from the ashes...');

-- Album 11: The Wall (51..55)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('In the Flesh?', '00:03:19', '1979-11-30', 'So ya thought ya might like to go to the show...'),
('Another Brick in the Wall, Pt. 2', '00:03:59', '1979-11-30', 'We don''t need no education...'),
('Mother', '00:05:33', '1979-11-30', 'Mother do you think they''ll drop the bomb?...'),
('Comfortably Numb', '00:06:22', '1979-11-30', 'Hello, is there anybody in there?...'),
('Hey You', '00:04:40', '1979-11-30', 'Hey you, out there in the cold...');

-- Album 12: Random Access Memories (56..60)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('Give Life Back to Music', '00:04:34', '2013-05-17', 'Kicking, squealing, Gucci little piggy...'),
('Get Lucky', '00:06:09', '2013-05-17', 'We''re up all night to get lucky...'),
('Lose Yourself to Dance', '00:05:53', '2013-05-17', 'Come on, come on, come on, come on...'),
('Instant Crush', '00:05:37', '2013-05-17', 'I didn''t have the heart to tell you...'),
('Contact', '00:06:21', '2013-05-17', 'Telemetry from the moons...');

-- -----------------------------
-- 8) COMPOSE (idMorceau, idAlbum, ordreDsAlbum)
-- On relie les morceaux 1..60 aux albums 1..12, 5 par album
-- -----------------------------
-- Album 1 (Abbey Road) -> morceaux 1..5
INSERT INTO Compose (idMorceau, idAlbum, ordreDsAlbum) VALUES
(1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5);

-- Album 2 -> morceaux 6..10
INSERT INTO Compose (idMorceau, idAlbum, ordreDsAlbum) VALUES
(6,2,1),(7,2,2),(8,2,3),(9,2,4),(10,2,5);

-- Album 3 -> morceaux 11..15
INSERT INTO Compose (idMorceau, idAlbum, ordreDsAlbum) VALUES
(11,3,1),(12,3,2),(13,3,3),(14,3,4),(15,3,5);

-- Album 4 -> morceaux 16..20
INSERT INTO Compose (idMorceau, idAlbum, ordreDsAlbum) VALUES
(16,4,1),(17,4,2),(18,4,3),(19,4,4),(20,4,5);

-- Album 5 -> morceaux 21..25
INSERT INTO Compose (idMorceau, idAlbum, ordreDsAlbum) VALUES
(21,5,1),(22,5,2),(23,5,3),(24,5,4),(25,5,5);

-- Album 6 -> morceaux 26..30
INSERT INTO Compose (idMorceau, idAlbum, ordreDsAlbum) VALUES
(26,6,1),(27,6,2),(28,6,3),(29,6,4),(30,6,5);

-- Album 7 -> morceaux 31..35
INSERT INTO Compose (idMorceau, idAlbum, ordreDsAlbum) VALUES
(31,7,1),(32,7,2),(33,7,3),(34,7,4),(35,7,5);

-- Album 8 -> morceaux 36..40
INSERT INTO Compose (idMorceau, idAlbum, ordreDsAlbum) VALUES
(36,8,1),(37,8,2),(38,8,3),(39,8,4),(40,8,5);

-- Album 9 -> morceaux 41..45
INSERT INTO Compose (idMorceau, idAlbum, ordreDsAlbum) VALUES
(41,9,1),(42,9,2),(43,9,3),(44,9,4),(45,9,5);

-- Album 10 -> morceaux 46..50
INSERT INTO Compose (idMorceau, idAlbum, ordreDsAlbum) VALUES
(46,10,1),(47,10,2),(48,10,3),(49,10,4),(50,10,5);

-- Album 11 -> morceaux 51..55
INSERT INTO Compose (idMorceau, idAlbum, ordreDsAlbum) VALUES
(51,11,1),(52,11,2),(53,11,3),(54,11,4),(55,11,5);

-- Album 12 -> morceaux 56..60
INSERT INTO Compose (idMorceau, idAlbum, ordreDsAlbum) VALUES
(56,12,1),(57,12,2),(58,12,3),(59,12,4),(60,12,5);

-- -----------------------------
-- 9) PUBLIE (idGroupe, idAlbum)
-- Lien groupe -> album (groupe qui publie l'album)
-- -----------------------------
INSERT INTO Publie (idGroupe, idAlbum) VALUES
(1,1),  -- The Beatles -> Abbey Road
(2,2),  -- Queen -> A Night at the Opera
(3,3),  -- Pink Floyd -> The Dark Side of the Moon
(4,4),  -- Daft Punk -> Discovery
(5,5),  -- Coldplay -> Parachutes
(6,6),  -- Radiohead -> OK Computer
(7,7),  -- Nirvana -> Nevermind
(8,8),  -- Led Zeppelin -> Led Zeppelin IV
(9,9),  -- Arctic Monkeys -> AM
(10,10),-- Imagine Dragons -> Evolve
(3,11), -- Pink Floyd -> The Wall
(4,12); -- Daft Punk -> Random Access Memories

-- -----------------------------
-- 10) JOUE (idGroupe, idMorceau)
-- Indique que le groupe joue/est l'interprète du morceau
-- Pour chaque album, on attache le groupe auteur aux morceaux correspondants.
-- -----------------------------
-- The Beatles (groupe 1) -> morceaux 1..5
INSERT INTO Joue (idGroupe, idMorceau) VALUES
(1,1),(1,2),(1,3),(1,4),(1,5);

-- Queen -> morceaux 6..10
INSERT INTO Joue (idGroupe, idMorceau) VALUES
(2,6),(2,7),(2,8),(2,9),(2,10);

-- Pink Floyd (album 3) -> morceaux 11..15
INSERT INTO Joue (idGroupe, idMorceau) VALUES
(3,11),(3,12),(3,13),(3,14),(3,15);

-- Daft Punk (album 4) -> morceaux 16..20
INSERT INTO Joue (idGroupe, idMorceau) VALUES
(4,16),(4,17),(4,18),(4,19),(4,20);

-- Coldplay -> morceaux 21..25
INSERT INTO Joue (idGroupe, idMorceau) VALUES
(5,21),(5,22),(5,23),(5,24),(5,25);

-- Radiohead -> morceaux 26..30
INSERT INTO Joue (idGroupe, idMorceau) VALUES
(6,26),(6,27),(6,28),(6,29),(6,30);

-- Nirvana -> morceaux 31..35
INSERT INTO Joue (idGroupe, idMorceau) VALUES
(7,31),(7,32),(7,33),(7,34),(7,35);

-- Led Zeppelin -> morceaux 36..40
INSERT INTO Joue (idGroupe, idMorceau) VALUES
(8,36),(8,37),(8,38),(8,39),(8,40);

-- Arctic Monkeys -> morceaux 41..45
INSERT INTO Joue (idGroupe, idMorceau) VALUES
(9,41),(9,42),(9,43),(9,44),(9,45);

-- Imagine Dragons -> morceaux 46..50
INSERT INTO Joue (idGroupe, idMorceau) VALUES
(10,46),(10,47),(10,48),(10,49),(10,50);

-- Pink Floyd -> The Wall morceaux 51..55
INSERT INTO Joue (idGroupe, idMorceau) VALUES
(3,51),(3,52),(3,53),(3,54),(3,55);

-- Daft Punk -> Random Access Memories morceaux 56..60
INSERT INTO Joue (idGroupe, idMorceau) VALUES
(4,56),(4,57),(4,58),(4,59),(4,60);

-- -----------------------------
-- 11) PARTICIPE (idArtiste, idMorceau)
-- On rattache les artistes aux morceaux de leurs groupes :
-- pour simplicité : tous les membres enregistrés du groupe sont marqués comme participants de chaque titre de l'album.
-- -----------------------------
-- The Beatles (artistes 1..4) -> morceaux 1..5
INSERT INTO Participe (idArtiste, idMorceau) VALUES
(1,1),(2,1),(3,1),(4,1),
(1,2),(2,2),(3,2),(4,2),
(1,3),(2,3),(3,3),(4,3),
(1,4),(2,4),(3,4),(4,4),
(1,5),(2,5),(3,5),(4,5);

-- Queen (artistes 5..7) -> morceaux 6..10
INSERT INTO Participe (idArtiste, idMorceau) VALUES
(5,6),(6,6),(7,6),
(5,7),(6,7),(7,7),
(5,8),(6,8),(7,8),
(5,9),(6,9),(7,9),
(5,10),(6,10),(7,10);

-- Pink Floyd (artistes 8,9) -> morceaux 11..15 and 51..55
INSERT INTO Participe (idArtiste, idMorceau) VALUES
(8,11),(9,11),(8,12),(9,12),(8,13),(9,13),(8,14),(9,14),(8,15),(9,15),
(8,51),(9,51),(8,52),(9,52),(8,53),(9,53),(8,54),(9,54),(8,55),(9,55);

-- Daft Punk (10,11) -> morceaux 16..20 and 56..60
INSERT INTO Participe (idArtiste, idMorceau) VALUES
(10,16),(11,16),(10,17),(11,17),(10,18),(11,18),(10,19),(11,19),(10,20),(11,20),
(10,56),(11,56),(10,57),(11,57),(10,58),(11,58),(10,59),(11,59),(10,60),(11,60);

-- Coldplay (12) -> morceaux 21..25
INSERT INTO Participe (idArtiste, idMorceau) VALUES
(12,21),(12,22),(12,23),(12,24),(12,25);

-- Radiohead (14) -> morceaux 26..30
INSERT INTO Participe (idArtiste, idMorceau) VALUES
(14,26),(14,27),(14,28),(14,29),(14,30);

-- Nirvana (15) -> morceaux 31..35
INSERT INTO Participe (idArtiste, idMorceau) VALUES
(15,31),(15,32),(15,33),(15,34),(15,35);

-- Led Zeppelin (16,17) -> morceaux 36..40
INSERT INTO Participe (idArtiste, idMorceau) VALUES
(16,36),(17,36),(16,37),(17,37),(16,38),(17,38),(16,39),(17,39),(16,40),(17,40);

-- Arctic Monkeys (18) -> morceaux 41..45
INSERT INTO Participe (idArtiste, idMorceau) VALUES
(18,41),(18,42),(18,43),(18,44),(18,45);

-- Imagine Dragons (19) -> morceaux 46..50
INSERT INTO Participe (idArtiste, idMorceau) VALUES
(19,46),(19,47),(19,48),(19,49),(19,50);

-- -----------------------------
-- 12) PLAYLIST (quelques exemples)
-- -----------------------------
INSERT INTO Playlist (titre, descPlaylist, visibilite, dCreation, pseudoCreateur) VALUES
('Best of 70s Rock', 'Hits incontournables des années 70', TRUE, '2024-01-01', 'melomane92'),
('Indie & Chill', 'Ambiance détendue pour l''après-midi', TRUE, '2024-02-14', 'indie_vibes'),
('Electro Party', 'Bangers électroniques', FALSE, '2024-03-03', 'electrohead'),
('Roadtrip Vibes', 'Rock pour prendre la route', TRUE, '2024-04-01', 'rockfan'),
('Chill Night', 'Ambiance douce du soir', TRUE, '2024-05-12', 'lofi_dreams'),
('Pink Floyd Essentials', 'Les meilleurs titres PF', TRUE, '2024-06-18', 'vinyl_addict'),
('Radiohead Mood', 'Sélection mélancolique', FALSE, '2024-07-02', 'jazzlover'),
('Queen Forever', 'La légende du rock', TRUE, '2024-07-10', 'queenfan'),
('Electro Workout', 'Pour s’entraîner', TRUE, '2024-08-01', 'electrohead'),
('Classic Rock Mix', 'Rock 60–80', TRUE, '2024-09-01', 'classicrock'),
('AM Indie Mix', 'Indie UK moderne', FALSE, '2024-09-10', 'indie_vibes'),
('Beatles Only', '100% Beatles', TRUE, '2024-09-20', 'beatlemania'),
('Relax & Focus', 'Musique calme', TRUE, '2024-10-03', 'lofi_dreams'),
('Epic Live Cuts', 'Performances live', TRUE, '2024-10-10', 'melomane92'),
('Morning Boost', 'Rock motivant', FALSE, '2024-10-21', 'rockfan'),
('Night Drive', 'Électronique sombre', TRUE, '2024-11-01', 'electrohead'),
('French Touch', 'Électro française', TRUE, '2024-11-12', 'electrohead'),
('Brit Rock Mix', 'Made in UK', TRUE, '2024-11-20', 'classicrock'),
('Indie Discovery', 'Découvertes indie', TRUE, '2024-12-05', 'indie_vibes'),
('Calm Piano', 'Ambiance zen', TRUE, '2025-01-10', 'jazzlover'),
('Power Rock', 'Rock énergique', TRUE, '2025-01-15', 'rockfan'),
('Soft Electro', 'Électronique douce', FALSE, '2025-01-20', 'lofi_dreams'),
('Best of US Rock', 'Top US', TRUE, '2025-01-25', 'vinyl_addict');


-- -----------------------------
-- 13) INCLUS (morceaux dans playlists) - on inclut quelques morceaux
-- -----------------------------
-- Playlist 1 (Best of 70s Rock) -> quelques classiques : Come Together (1), Bohemian Rhapsody (6), Stairway to Heaven (39)
INSERT INTO Inclus (idPlaylist, idMorceau, ordreDsPlaylist) VALUES
(1,1,1),(1,6,2),(1,39,3),(1,14,4);

-- Playlist 2 (Indie & Chill) -> Arctic Monkeys, Radiohead, Coldplay
INSERT INTO Inclus (idPlaylist, idMorceau, ordreDsPlaylist) VALUES
(2,41,1),(2,26,2),(2,23,3),(2,44,4);

-- Playlist 3 (Electro Party) -> Daft Punk hits
INSERT INTO Inclus (idPlaylist, idMorceau, ordreDsPlaylist) VALUES
(3,16,1),(3,18,2),(3,57,3),(3,59,4);

-- ============================================================
-- PLAYLIST 4 — Roadtrip Vibes (rock)
-- ============================================================
INSERT INTO Inclus VALUES
(4, 1, 1),
(4, 2, 2),
(4, 5, 3),
(4, 6, 4),
(4, 39, 5);

-- ============================================================
-- PLAYLIST 5 — Chill Night (lofi)
-- ============================================================
INSERT INTO Inclus VALUES
(5, 23, 1),
(5, 24, 2),
(5, 21, 3),
(5, 47, 4),
(5, 48, 5);

-- ============================================================
-- PLAYLIST 6 — Pink Floyd Essentials
-- ============================================================
INSERT INTO Inclus VALUES
(6, 11, 1),
(6, 12, 2),
(6, 13, 3),
(6, 14, 4),
(6, 54, 5);

-- ============================================================
-- PLAYLIST 7 — Radiohead Mood
-- ============================================================
INSERT INTO Inclus VALUES
(7, 28, 1),
(7, 29, 2),
(7, 52, 3),
(7, 54, 4);

-- ============================================================
-- PLAYLIST 8 — Queen Forever
-- ============================================================
INSERT INTO Inclus VALUES
(8, 6, 1),
(8, 7, 2),
(8, 8, 3),
(8, 9, 4),
(8, 10, 5);

-- ============================================================
-- PLAYLIST 9 — Electro Workout
-- ============================================================
INSERT INTO Inclus VALUES
(9, 16, 1),
(9, 17, 2),
(9, 18, 3),
(9, 57, 4),
(9, 59, 5);

-- ============================================================
-- PLAYLIST 10 — Classic Rock Mix
-- ============================================================
INSERT INTO Inclus VALUES
(10, 1, 1),
(10, 14, 2),
(10, 39, 3),
(10, 8, 4),
(10, 5, 5);

-- ============================================================
-- PLAYLIST 11 — AM Indie Mix
-- ============================================================
INSERT INTO Inclus VALUES
(11, 41, 1),
(11, 42, 2),
(11, 43, 3),
(11, 44, 4),
(11, 45, 5);

-- ============================================================
-- PLAYLIST 12 — Beatles Only
-- ============================================================
INSERT INTO Inclus VALUES
(12, 1, 1),
(12, 2, 2),
(12, 3, 3),
(12, 5, 4);

-- ============================================================
-- PLAYLIST 13 — Relax & Focus
-- ============================================================
INSERT INTO Inclus VALUES
(13, 23, 1),
(13, 24, 2),
(13, 47, 3),
(13, 48, 4);

-- ============================================================
-- PLAYLIST 14 — Epic Live Cuts
-- ============================================================
INSERT INTO Inclus VALUES
(14, 39, 1),
(14, 14, 2),
(14, 8, 3),
(14, 54, 4);

-- ============================================================
-- PLAYLIST 15 — Morning Boost
-- ============================================================
INSERT INTO Inclus VALUES
(15, 6, 1),
(15, 34, 2),
(15, 37, 3),
(15, 8, 4);

-- ============================================================
-- PLAYLIST 16 — Night Drive (electro sombre)
-- ============================================================
INSERT INTO Inclus VALUES
(16, 57, 1),
(16, 58, 2),
(16, 59, 3),
(16, 18, 4);

-- ============================================================
-- PLAYLIST 17 — French Touch
-- ============================================================
INSERT INTO Inclus VALUES
(17, 16, 1),
(17, 17, 2),
(17, 18, 3),
(17, 19, 4);

-- ============================================================
-- PLAYLIST 18 — Brit Rock Mix
-- ============================================================
INSERT INTO Inclus VALUES
(18, 1, 1),
(18, 6, 2),
(18, 39, 3),
(18, 41, 4);

-- ============================================================
-- PLAYLIST 19 — Indie Discovery
-- ============================================================
INSERT INTO Inclus VALUES
(19, 41, 1),
(19, 42, 2),
(19, 43, 3),
(19, 45, 4),
(19, 26, 5);

-- ============================================================
-- PLAYLIST 20 — Calm Piano (radiohead / chill)
-- ============================================================
INSERT INTO Inclus VALUES
(20, 28, 1),
(20, 29, 2),
(20, 52, 3);

-- ============================================================
-- PLAYLIST 21 — Power Rock
-- ============================================================
INSERT INTO Inclus VALUES
(21, 6, 1),
(21, 7, 2),
(21, 8, 3),
(21, 39, 4);

-- ============================================================
-- PLAYLIST 22 — Soft Electro
-- ============================================================
INSERT INTO Inclus VALUES
(22, 16, 1),
(22, 57, 2),
(22, 58, 3);

-- ============================================================
-- PLAYLIST 23 — Best of US Rock
-- ============================================================
INSERT INTO Inclus VALUES
(23, 7, 1),
(23, 8, 2),
(23, 39, 3),
(23, 34, 4);

-- -----------------------------
-- 14) ECOUTE (pseudo, idMorceau, dureeEcoute, dateEcoute)
-- Quelques écoutes simulées (clé primaire pseudo+idMorceau)
-- -----------------------------
INSERT INTO Ecoute (pseudo, idMorceau, dureeEcoute, dateEcoute) VALUES
-- melomane92 : fan de rock classique
('melomane92', 1, '00:04:20', '2024-09-01 10:00:00'),
('melomane92', 2, '00:03:03', '2024-09-01 10:05:00'),
('melomane92', 6, '00:05:55', '2024-09-03 18:45:00'),
('melomane92', 39, '00:08:02', '2024-09-05 21:10:00'),
('melomane92', 14, '00:06:23', '2024-09-07 13:20:00'),
('melomane92', 39, '00:08:02', '2024-09-08 09:00:00'),
('melomane92', 6, '00:05:55', '2024-09-09 18:00:00'),
('melomane92', 1, '00:04:20', '2024-09-10 08:00:00'),
('melomane92', 3, '00:03:27', '2024-09-12 12:30:00'),
('melomane92', 36, '00:04:55', '2024-09-14 17:30:00'),
('melomane92', 5, '00:02:51', '2024-09-16 11:10:00'),
('melomane92', 7, '00:02:52', '2024-09-18 12:40:00'),
('melomane92', 8, '00:03:38', '2024-09-19 14:30:00'),
('melomane92', 39, '00:08:02', '2024-09-20 10:20:00'),
('melomane92', 14, '00:06:23', '2024-09-22 13:00:00'),
('melomane92', 1, '00:04:20', '2024-09-23 09:05:00'),
('melomane92', 2, '00:03:03', '2024-09-24 10:10:00'),
('melomane92', 3, '00:03:27', '2024-09-25 11:15:00'),
('melomane92', 6, '00:05:55', '2024-09-26 18:40:00'),
('melomane92', 39, '00:08:02', '2024-09-27 21:30:00'),

-- rockfan : Queen, Nirvana et Zeppelin
('rockfan', 6, '00:05:55', '2024-09-02 11:15:00'),
('rockfan', 7, '00:02:52', '2024-09-03 19:00:00'),
('rockfan', 8, '00:03:38', '2024-09-05 20:10:00'),
('rockfan', 34, '00:03:03', '2024-09-07 22:00:00'),
('rockfan', 39, '00:08:02', '2024-09-10 08:40:00'),
('rockfan', 37, '00:03:40', '2024-09-12 14:20:00'),
('rockfan', 8, '00:03:38', '2024-09-15 18:00:00'),
('rockfan', 6, '00:05:55', '2024-09-17 20:00:00'),
('rockfan', 7, '00:02:52', '2024-09-18 20:00:00'),
('rockfan', 6, '00:05:55', '2024-09-20 12:15:00'),
('rockfan', 7, '00:02:52', '2024-09-21 20:10:00'),
('rockfan', 8, '00:03:38', '2024-09-22 19:50:00'),
('rockfan', 34, '00:03:03', '2024-09-23 17:25:00'),
('rockfan', 39, '00:08:02', '2024-09-25 08:40:00'),
('rockfan', 37, '00:03:40', '2024-09-26 14:50:00'),
('rockfan', 6, '00:05:55', '2024-09-27 20:00:00'),
('rockfan', 7, '00:02:52', '2024-09-28 20:00:00'),
('rockfan', 8, '00:03:38', '2024-09-29 18:00:00'),
('rockfan', 39, '00:08:02', '2024-10-01 21:00:00'),

-- jazzlover : Pink Floyd, Radiohead
('jazzlover', 11, '00:01:30', '2024-09-01 11:00:00'),
('jazzlover', 12, '00:02:43', '2024-09-02 12:10:00'),
('jazzlover', 13, '00:07:06', '2024-09-03 13:30:00'),
('jazzlover', 14, '00:06:23', '2024-09-05 15:00:00'),
('jazzlover', 28, '00:04:27', '2024-09-08 09:00:00'),
('jazzlover', 29, '00:04:24', '2024-09-09 10:00:00'),
('jazzlover', 52, '00:03:59', '2024-09-11 22:00:00'),
('jazzlover', 54, '00:06:22', '2024-09-12 23:00:00'),
('jazzlover', 14, '00:06:23', '2024-09-15 12:30:00'),
('jazzlover', 11, '00:01:30', '2024-09-16 11:30:00'),
('jazzlover', 12, '00:02:43', '2024-09-17 12:10:00'),
('jazzlover', 13, '00:07:06', '2024-09-18 16:20:00'),
('jazzlover', 14, '00:06:23', '2024-09-20 15:00:00'),
('jazzlover', 28, '00:04:27', '2024-09-22 10:00:00'),
('jazzlover', 29, '00:04:24', '2024-09-23 11:00:00'),
('jazzlover', 54, '00:06:22', '2024-09-25 20:00:00'),
('jazzlover', 52, '00:03:59', '2024-09-26 22:00:00'),
('jazzlover', 14, '00:06:23', '2024-09-28 12:30:00'),
('jazzlover', 12, '00:02:43', '2024-09-29 13:00:00'),

-- beatlemania : Beatles, Coldplay
('beatlemania', 1, '00:04:20', '2024-09-01 09:00:00'),
('beatlemania', 2, '00:03:03', '2024-09-02 09:00:00'),
('beatlemania', 3, '00:03:27', '2024-09-03 09:00:00'),
('beatlemania', 23, '00:04:29', '2024-09-04 21:00:00'),
('beatlemania', 24, '00:02:30', '2024-09-05 21:30:00'),
('beatlemania', 25, '00:04:09', '2024-09-06 22:00:00'),
('beatlemania', 1, '00:04:20', '2024-09-07 09:00:00'),
('beatlemania', 5, '00:02:51', '2024-09-08 09:00:00'),
('beatlemania', 1, '00:04:20', '2024-09-09 09:00:00'),
('beatlemania', 2, '00:03:03', '2024-09-10 09:00:00'),
('beatlemania', 3, '00:03:27', '2024-09-11 09:00:00'),
('beatlemania', 23, '00:04:29', '2024-09-12 21:00:00'),
('beatlemania', 24, '00:02:30', '2024-09-13 21:30:00'),
('beatlemania', 5, '00:02:51', '2024-09-14 11:20:00'),
('beatlemania', 25, '00:04:09', '2024-09-15 22:00:00'),
('beatlemania', 3, '00:03:27', '2024-09-16 09:00:00'),
('beatlemania', 1, '00:04:20', '2024-09-17 09:00:00'),
('beatlemania', 23, '00:04:29', '2024-09-18 09:30:00'),

-- vinyl_addict : aime tout, surtout Pink Floyd & Zeppelin
('vinyl_addict', 13, '00:07:06', '2024-09-02 08:00:00'),
('vinyl_addict', 14, '00:06:23', '2024-09-03 08:00:00'),
('vinyl_addict', 39, '00:08:02', '2024-09-04 08:00:00'),
('vinyl_addict', 52, '00:03:59', '2024-09-05 08:00:00'),
('vinyl_addict', 11, '00:01:30', '2024-09-06 08:00:00'),
('vinyl_addict', 12, '00:02:43', '2024-09-07 08:00:00'),
('vinyl_addict', 40, '00:03:32', '2024-09-08 08:00:00'),
('vinyl_addict', 14, '00:06:23', '2024-09-09 08:00:00'),
('vinyl_addict', 11, '00:01:30', '2024-09-12 08:00:00'),
('vinyl_addict', 12, '00:02:43', '2024-09-13 08:00:00'),
('vinyl_addict', 13, '00:07:06', '2024-09-14 08:00:00'),
('vinyl_addict', 14, '00:06:23', '2024-09-15 08:00:00'),
('vinyl_addict', 39, '00:08:02', '2024-09-16 08:00:00'),
('vinyl_addict', 52, '00:03:59', '2024-09-17 08:00:00'),
('vinyl_addict', 40, '00:03:32', '2024-09-18 08:00:00'),
('vinyl_addict', 54, '00:06:22', '2024-09-19 08:00:00'),
('vinyl_addict', 39, '00:08:02', '2024-09-20 08:00:00'),
('vinyl_addict', 14, '00:06:23', '2024-09-21 08:00:00'),

-- electrohead : Daft Punk et electro
('electrohead', 16, '00:05:20', '2024-09-01 22:00:00'),
('electrohead', 17, '00:04:58', '2024-09-02 22:00:00'),
('electrohead', 18, '00:03:45', '2024-09-03 22:00:00'),
('electrohead', 57, '00:05:53', '2024-09-05 22:30:00'),
('electrohead', 59, '00:05:37', '2024-09-06 23:00:00'),
('electrohead', 16, '00:05:20', '2024-09-08 23:30:00'),
('electrohead', 58, '00:05:53', '2024-09-09 23:00:00'),
('electrohead', 19, '00:07:10', '2024-09-10 23:15:00'),
('electrohead', 16, '00:05:20', '2024-09-12 23:00:00'),
('electrohead', 17, '00:04:58', '2024-09-13 23:00:00'),
('electrohead', 18, '00:03:45', '2024-09-14 23:00:00'),
('electrohead', 57, '00:05:53', '2024-09-15 22:30:00'),
('electrohead', 58, '00:05:53', '2024-09-16 22:45:00'),
('electrohead', 59, '00:05:37', '2024-09-17 23:00:00'),
('electrohead', 19, '00:07:10', '2024-09-18 23:10:00'),
('electrohead', 16, '00:05:20', '2024-09-20 23:00:00'),
('electrohead', 57, '00:05:53', '2024-09-22 23:30:00'),
('electrohead', 18, '00:03:45', '2024-09-23 23:00:00'),

-- queenfan : Queen + duos rock
('queenfan', 6, '00:05:55', '2024-10-01 09:00:00'),
('queenfan', 7, '00:02:52', '2024-10-02 09:15:00'),
('queenfan', 8, '00:03:38', '2024-10-03 09:30:00'),
('queenfan', 9, '00:03:30', '2024-10-04 09:45:00'),
('queenfan', 10, '00:03:05', '2024-10-05 10:00:00'),
('queenfan', 6, '00:05:55', '2024-10-07 09:00:00'),
('queenfan', 7, '00:02:52', '2024-10-08 09:15:00'),
('queenfan', 8, '00:03:38', '2024-10-09 09:30:00'),
('queenfan', 6, '00:05:55', '2024-10-10 09:00:00'),
('queenfan', 7, '00:02:52', '2024-10-11 09:15:00'),
('queenfan', 8, '00:03:38', '2024-10-12 09:30:00'),
('queenfan', 9, '00:03:30', '2024-10-13 09:45:00'),
('queenfan', 10, '00:03:05', '2024-10-14 10:00:00'),
('queenfan', 6, '00:05:55', '2024-10-15 09:00:00'),
('queenfan', 7, '00:02:52', '2024-10-16 09:15:00'),
('queenfan', 8, '00:03:38', '2024-10-17 09:30:00'),
('queenfan', 9, '00:03:30', '2024-10-18 09:45:00'),
('queenfan', 10, '00:03:05', '2024-10-19 10:00:00'),

-- classicrock : Beatles, Led Zeppelin, Pink Floyd
('classicrock', 1, '00:04:20', '2024-09-01 18:00:00'),
('classicrock', 14, '00:06:23', '2024-09-03 18:00:00'),
('classicrock', 39, '00:08:02', '2024-09-05 18:00:00'),
('classicrock', 54, '00:06:22', '2024-09-07 18:00:00'),
('classicrock', 11, '00:01:30', '2024-09-09 18:00:00'),
('classicrock', 12, '00:02:43', '2024-09-10 18:00:00'),
('classicrock', 39, '00:08:02', '2024-09-12 18:00:00'),
('classicrock', 40, '00:03:32', '2024-09-13 18:00:00'),
('classicrock', 1, '00:04:20', '2024-09-15 18:00:00'),
('classicrock', 14, '00:06:23', '2024-09-16 18:00:00'),
('classicrock', 39, '00:08:02', '2024-09-17 18:00:00'),
('classicrock', 54, '00:06:22', '2024-09-18 18:00:00'),
('classicrock', 12, '00:02:43', '2024-09-19 18:00:00'),
('classicrock', 11, '00:01:30', '2024-09-20 18:00:00'),
('classicrock', 40, '00:03:32', '2024-09-21 18:00:00'),
('classicrock', 14, '00:06:23', '2024-09-22 18:00:00'),
('classicrock', 1, '00:04:20', '2024-09-23 18:00:00'),
('classicrock', 39, '00:08:02', '2024-09-24 18:00:00'),

-- indie_vibes : Arctic Monkeys, Coldplay, Radiohead
('indie_vibes', 41, '00:04:32', '2024-09-03 14:20:00'),
('indie_vibes', 42, '00:03:21', '2024-09-04 14:25:00'),
('indie_vibes', 26, '00:04:44', '2024-09-05 14:30:00'),
('indie_vibes', 23, '00:04:29', '2024-09-06 14:35:00'),
('indie_vibes', 43, '00:04:16', '2024-09-07 14:40:00'),
('indie_vibes', 44, '00:03:27', '2024-09-08 14:45:00'),
('indie_vibes', 45, '00:03:03', '2024-09-09 14:50:00'),
('indie_vibes', 26, '00:04:44', '2024-09-10 14:55:00'),
('indie_vibes', 41, '00:04:32', '2024-09-11 14:20:00'),
('indie_vibes', 42, '00:03:21', '2024-09-12 14:25:00'),
('indie_vibes', 26, '00:04:44', '2024-09-13 14:30:00'),
('indie_vibes', 23, '00:04:29', '2024-09-14 14:35:00'),
('indie_vibes', 43, '00:04:16', '2024-09-15 14:40:00'),
('indie_vibes', 45, '00:03:03', '2024-09-16 14:50:00'),
('indie_vibes', 44, '00:03:27', '2024-09-17 14:55:00'),
('indie_vibes', 26, '00:04:44', '2024-09-18 14:50:00'),
('indie_vibes', 23, '00:04:29', '2024-09-19 14:55:00'),
('indie_vibes', 41, '00:04:32', '2024-09-21 14:20:00'),

-- lofi_dreams : Coldplay, Arctic Monkeys, Imagine Dragons
('lofi_dreams', 23, '00:04:29', '2024-10-02 20:45:00'),
('lofi_dreams', 21, '00:02:17', '2024-10-03 20:50:00'),
('lofi_dreams', 24, '00:02:30', '2024-10-04 21:00:00'),
('lofi_dreams', 41, '00:04:32', '2024-10-05 21:15:00'),
('lofi_dreams', 47, '00:03:21', '2024-10-06 21:30:00'),
('lofi_dreams', 48, '00:03:24', '2024-10-07 21:45:00'),
('lofi_dreams', 49, '00:03:07', '2024-10-08 22:00:00'),
('lofi_dreams', 23, '00:04:29', '2024-10-09 22:10:00'),
('lofi_dreams', 23, '00:04:29', '2024-10-10 20:45:00'),
('lofi_dreams', 21, '00:02:17', '2024-10-11 20:50:00'),
('lofi_dreams', 24, '00:02:30', '2024-10-12 21:00:00'),
('lofi_dreams', 41, '00:04:32', '2024-10-13 21:15:00'),
('lofi_dreams', 47, '00:03:21', '2024-10-14 21:30:00'),
('lofi_dreams', 48, '00:03:24', '2024-10-15 21:45:00'),
('lofi_dreams', 49, '00:03:07', '2024-10-16 22:00:00'),
('lofi_dreams', 23, '00:04:29', '2024-10-17 22:10:00'),
('lofi_dreams', 41, '00:04:32', '2024-10-18 20:30:00'),
('lofi_dreams', 47, '00:03:21', '2024-10-19 20:45:00');

-- -----------------------------
-- 15) SUITUTILISATEUR (qui suit qui)
-- -----------------------------
INSERT INTO SuitUtilisateur (suivant, suivi, dDebut, dFin) VALUES
('melomane92', 'rockfan', '2024-01-10', '2025-01-01'),
('indie_vibes', 'beatlemania', '2024-02-01', NULL),
('lofi_dreams', 'queenfan', '2024-03-12', NULL),
('melomane92', 'rockfan', '2025-01-10', NULL),
('rockfan', 'melomane92', '2024-04-01', NULL),
('rockfan', 'queenfan', '2024-05-01', NULL),
('rockfan', 'vinyl_addict', '2024-06-10', NULL),
('indie_vibes', 'rockfan', '2024-07-01', NULL),
('indie_vibes', 'classicrock', '2024-08-12', NULL),
('jazzlover', 'vinyl_addict', '2024-09-02', NULL),
('jazzlover', 'indie_vibes', '2024-09-12', NULL),
('beatlemania', 'melomane92', '2024-09-20', NULL),
('beatlemania', 'rockfan', '2024-09-22', NULL),
('beatlemania', 'queenfan', '2024-09-23', NULL),
('vinyl_addict', 'rockfan', '2024-09-30', NULL),
('vinyl_addict', 'jazzlover', '2024-10-01', NULL),
('queenfan', 'indie_vibes', '2024-10-15', NULL),
('queenfan', 'classicrock', '2024-10-16', NULL),
('classicrock', 'rockfan', '2024-10-20', NULL),
('classicrock', 'melomane92', '2024-10-21', NULL),
('lofi_dreams', 'indie_vibes', '2024-10-25', NULL),
('lofi_dreams', 'jazzlover', '2024-11-01', NULL),
('electrohead', 'vinyl_addict', '2024-11-05', NULL),
('electrohead', 'queenfan', '2024-11-06', NULL),
('melomane92', 'classicrock', '2024-11-10', NULL),
('melomane92', 'jazzlover', '2024-11-12', NULL),
('rockfan', 'classicrock', '2024-11-20', NULL),
('rockfan', 'indie_vibes', '2024-11-22', NULL),
('indie_vibes', 'queenfan', '2024-12-01', NULL);

-- -----------------------------
-- 16) SUITGROUPE (utilisateur suit groupe)
-- -----------------------------
INSERT INTO SuitGroupe (pseudo, idGroupe, dDebut, dFin) VALUES
('rockfan', 1, '2024-01-05', NULL),
('queenfan', 2, '2024-01-06', '2025-03-15'),
('queenfan', 2, '2025-03-15', NULL),
('electrohead', 4, '2024-02-20', NULL),
('indie_vibes', 9, '2024-03-01', NULL),
('melomane92', 8, '2024-05-01', NULL),
('melomane92', 1, '2024-06-01', NULL),
('rockfan', 2, '2024-06-15', NULL),
('rockfan', 8, '2024-07-01', NULL),
('jazzlover', 3, '2024-07-15', NULL),
('jazzlover', 6, '2024-07-20', NULL),
('beatlemania', 1, '2024-08-01', NULL),
('beatlemania', 5, '2024-08-10', NULL),
('vinyl_addict', 3, '2024-09-01', NULL),
('vinyl_addict', 8, '2024-09-02', NULL),
('queenfan', 2, '2024-09-15', NULL),
('queenfan', 1, '2024-09-20', NULL),
('classicrock', 1, '2024-10-01', NULL),
('classicrock', 3, '2024-10-02', NULL),
('indie_vibes', 9, '2024-10-15', NULL),
('indie_vibes', 5, '2024-10-20', NULL),
('lofi_dreams', 10, '2024-11-01', NULL),
('lofi_dreams', 5, '2024-11-05', NULL),
('electrohead', 4, '2024-11-10', NULL),
('electrohead', 10, '2024-11-15', NULL);

-- -----------------------------
-- INCLUSION DU CAS DE L'ÉNNONCÉ OÙ TOUS LES ARTISTES NE PARTICIPENT PAS À UN ENREGISTREMENT ET IL Y A DES INVITÉS
-- -----------------------------

-- Groupes
INSERT INTO Groupe (nom, dCreation, nationalite, genre) VALUES
('Nightwish', '1996-01-01', 'Finlande', 'Symphonic Metal'),
('Within Temptation', '1996-01-01', 'Pays-Bas', 'Symphonic Metal');

-- Artistes
INSERT INTO Artiste (nom, prenom, nationalite, dNaissance, dMort) VALUES
('Turunen', 'Tarja', 'Finlandaise', '1977-08-17', NULL),
('Holopainen', 'Tuomas', 'Finlandais', '1976-12-25', NULL),
('Liimatainen', 'Emppu', 'Finlandais', '1977-06-24', NULL),
('Vuorinen', 'Erno', 'Finlandais', '1978-06-24', NULL),
('Hietala', 'Marko', 'Finlandais', '1966-01-14', NULL),
('Sharon den Adel', NULL, 'Néerlandaise', '1974-07-12', NULL),
('Robert Westerholt', NULL, 'Néerlandais', '1975-01-02', NULL);

-- Nightwish (idGroupe supposé 11)
INSERT INTO Appartient (idArtiste, idGroupe, idRole, dDebut, dFin) VALUES
(20, 11, 1, '1996-01-01', '2005-10-21'), -- Tarja Turunen, chanteuse
(21, 11, 5, '1996-01-01', NULL),         -- Tuomas Holopainen, claviériste
(22, 11, 2, '1996-01-01', NULL),         -- Emppu Liimatainen, guitariste
(24, 11, 4, '2001-01-01', NULL);         -- Marko Hietala, bassiste/chanteur

-- Within Temptation (idGroupe supposé 12)
INSERT INTO Appartient (idArtiste, idGroupe, idRole, dDebut, dFin) VALUES
(25, 12, 1, '1996-01-01', NULL),  -- Sharon den Adel, chanteuse
(26, 12, 2, '1996-01-01', NULL);  -- Robert Westerholt, guitariste

INSERT INTO Album (titre, dParution, descAlbum)
VALUES ('Dark Passion Play', '2007-09-28', 'Album de Nightwish, premier sans Tarja Turunen.');

INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles)
VALUES ('Last of the Wilds', '00:06:18', '2007-09-28', NULL);

INSERT INTO Compose (idMorceau, idAlbum, ordreDsAlbum)
VALUES (61, 13, 10);

-- Morceau joué par Nightwish
INSERT INTO Joue (idGroupe, idMorceau)
VALUES (11, 61);

-- Artistes participants (sans Tarja)
INSERT INTO Participe (idArtiste, idMorceau)
VALUES
(21, 61), -- Tuomas Holopainen (clavier)
(22, 61), -- Emppu Liimatainen (guitare)
(24, 61); -- Marko Hietala (basse)

INSERT INTO Album (titre, dParution, descAlbum)
VALUES ('Hydra', '2014-01-31', 'Album de Within Temptation comportant plusieurs duos.');

INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles)
VALUES ('Paradise (What About Us?)', '00:05:19', '2013-09-27', 
E'There’s no sense, the fire burns... what about us?');

INSERT INTO Compose (idMorceau, idAlbum, ordreDsAlbum)
VALUES (62, 14, 3);

-- Morceau joué par Within Temptation
INSERT INTO Joue (idGroupe, idMorceau)
VALUES (12, 62);

-- Artistes participants
INSERT INTO Participe (idArtiste, idMorceau)
VALUES
(25, 62), -- Sharon den Adel
(26, 62), -- Robert Westerholt
(20, 62); -- Tarja Turunen (invitée)

-- -----------------------------
-- FIN DU SCRIPT D'INSERTION
-- -----------------------------