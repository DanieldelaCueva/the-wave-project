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
('Random Access Memories', '2013-05-17', 'Dernier album studio de Daft Punk.'),
('Revolver', '1966-08-05', 'Album majeur des Beatles.'),
('Jazz', '1978-11-10', 'Album culte de Queen.'),
('Wish You Were Here', '1975-09-12', 'Classique de Pink Floyd.'),
('Human After All', '2005-03-14', 'Troisième album de Daft Punk.'),
('A Rush of Blood to the Head', '2002-08-26', 'Deuxième album de Coldplay.'),
('In Rainbows', '2007-10-10', 'Album révolutionnaire de Radiohead.'),
('In Utero', '1993-09-21', 'Dernier album de Nirvana.'),
('Houses of the Holy', '1973-03-28', 'Album classique de Led Zeppelin.'),
('Favourite Worst Nightmare', '2007-04-23', 'Deuxième album Arctic Monkeys.'),
('Smoke + Mirrors', '2015-02-17', 'Deuxième album Imagine Dragons.');

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

-- Album 13 — Revolver (61–65)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('Taxman', '00:02:39', '1966-08-05', 'Let me tell you how it will be...'),
('Eleanor Rigby', '00:02:06', '1966-08-05', 'Ah look at all the lonely people...'),
('I''m Only Sleeping', '00:03:03', '1966-08-05', 'When I wake up early in the morning...'),
('Here, There and Everywhere', '00:02:26', '1966-08-05', 'To lead a better life...'),
('Tomorrow Never Knows', '00:03:00', '1966-08-05', 'Turn off your mind, relax...');

-- Album 14 — Jazz (66–70)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('Mustapha', '00:03:03', '1978-11-10', 'Ibrahim...'),
('Fat Bottomed Girls', '00:04:16', '1978-11-10', 'Are you gonna take me home tonight...'),
('Bicycle Race', '00:03:01', '1978-11-10', 'I want to ride my bicycle...'),
('If You Can''t Beat Them', '00:04:15', '1978-11-10', 'Keep your chin up...'),
('Don''t Stop Me Now', '00:03:29', '1978-11-10', 'Tonight I''m gonna have myself a real good time...');

-- Album 15 — Wish You Were Here (71–75)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('Shine On You Crazy Diamond (Pt. I–V)', '00:13:31', '1975-09-12', 'Remember when you were young...'),
('Welcome to the Machine', '00:07:31', '1975-09-12', 'Welcome my son...'),
('Have a Cigar', '00:05:08', '1975-09-12', 'Come in here, dear boy...'),
('Wish You Were Here', '00:05:40', '1975-09-12', 'So, so you think you can tell...'),
('Shine On You Crazy Diamond (Pt. VI–IX)', '00:12:29', '1975-09-12', 'Nobody knows where you are...');

-- Album 16 — Human After All (76–80)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('Human After All', '00:05:20', '2005-03-14', 'We are human...'),
('The Prime Time of Your Life', '00:04:23', '2005-03-14', 'Live...'),
('Robot Rock', '00:04:47', '2005-03-14', 'Rock, robot rock...'),
('Make Love', '00:04:49', '2005-03-14', 'Instrumental...'),
('Technologic', '00:04:43', '2005-03-14', 'Buy it, use it, break it...');

-- Album 17 — A Rush of Blood (81–85)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('Politik', '00:05:18', '2002-08-26', 'Give me real...'),
('In My Place', '00:03:48', '2002-08-26', 'In my place...'),
('God Put a Smile...', '00:04:58', '2002-08-26', 'Where do we go...'),
('The Scientist', '00:05:09', '2002-08-26', 'Come up to meet you...'),
('Clocks', '00:05:07', '2002-08-26', 'Lights go out and I can''t be saved...');

-- Album 18 — In Rainbows (86–90)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('15 Step', '00:03:57', '2007-10-10', 'How come I end up where I started...'),
('Bodysnatchers', '00:04:02', '2007-10-10', 'I do not...'),
('Nude', '00:04:15', '2007-10-10', 'Don''t get any big ideas...'),
('Weird Fishes', '00:05:18', '2007-10-10', 'In the deepest ocean...'),
('Reckoner', '00:04:50', '2007-10-10', 'You are not to blame...');

-- Album 19 — In Utero (91–95)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('Serve the Servants', '00:03:36', '1993-09-21', 'Teenage angst has paid off well...'),
('Scentless Apprentice', '00:03:49', '1993-09-21', 'Like the...'),
('Heart-Shaped Box', '00:04:39', '1993-09-21', 'She eyes me like a Pisces...'),
('Rape Me', '00:02:49', '1993-09-21', 'Rape me...'),
('All Apologies', '00:03:51', '1993-09-21', 'What else should I be...');

-- Album 20 — Houses of the Holy (96–100)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('The Song Remains the Same', '00:05:29', '1973-03-28', 'I had a dream...'),
('The Rain Song', '00:07:39', '1973-03-28', 'It is the springtime...'),
('Over the Hills and Far Away', '00:04:50', '1973-03-28', 'Hey lady...'),
('Dancing Days', '00:03:43', '1973-03-28', 'Dancing days are here again...'),
('No Quarter', '00:07:00', '1973-03-28', 'Close the door, put out the light...');

-- Album 21 — Favourite Worst Nightmare (101–105)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('Brianstorm', '00:02:52', '2007-04-23', 'Brian...'),
('Teddy Picker', '00:03:25', '2007-04-23', 'They''ve sped up...'),
('Fluorescent Adolescent', '00:03:03', '2007-04-23', 'You used to get it...'),
('505', '00:04:13', '2007-04-23', 'I''m going back to 505...'),
('Do Me a Favour', '00:03:26', '2007-04-23', 'Well the morning was complete...');

-- Album 22 — Smoke + Mirrors (106–110)
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles) VALUES
('Shots', '00:03:52', '2015-02-17', 'I''m sorry for everything...'),
('Gold', '00:03:36', '2015-02-17', 'First things first...'),
('Smoke and Mirrors', '00:04:20', '2015-02-17', 'This is my word...'),
('I''m So Sorry', '00:03:50', '2015-02-17', 'About time...'),
('Friction', '00:03:35', '2015-02-17', 'Get down...');

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

INSERT INTO Compose VALUES
(61,13,1),(62,13,2),(63,13,3),(64,13,4),(65,13,5),
(66,14,1),(67,14,2),(68,14,3),(69,14,4),(70,14,5),
(71,15,1),(72,15,2),(73,15,3),(74,15,4),(75,15,5),
(76,16,1),(77,16,2),(78,16,3),(79,16,4),(80,16,5),
(81,17,1),(82,17,2),(83,17,3),(84,17,4),(85,17,5),
(86,18,1),(87,18,2),(88,18,3),(89,18,4),(90,18,5),
(91,19,1),(92,19,2),(93,19,3),(94,19,4),(95,19,5),
(96,20,1),(97,20,2),(98,20,3),(99,20,4),(100,20,5),
(101,21,1),(102,21,2),(103,21,3),(104,21,4),(105,21,5),
(106,22,1),(107,22,2),(108,22,3),(109,22,4),(110,22,5);

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
(4,12), -- Daft Punk -> Random Access Memories
(1,13),  -- Beatles
(2,14),  -- Queen
(3,15),  -- Pink Floyd
(4,16),  -- Daft Punk
(5,17),  -- Coldplay
(6,18),  -- Radiohead
(7,19),  -- Nirvana
(8,20),  -- Led Zeppelin
(9,21),  -- Arctic Monkeys
(10,22); -- Imagine Dragons


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

INSERT INTO Joue VALUES
(1,61),(1,62),(1,63),(1,64),(1,65),
(2,66),(2,67),(2,68),(2,69),(2,70),
(3,71),(3,72),(3,73),(3,74),(3,75),
(4,76),(4,77),(4,78),(4,79),(4,80),
(5,81),(5,82),(5,83),(5,84),(5,85),
(6,86),(6,87),(6,88),(6,89),(6,90),
(7,91),(7,92),(7,93),(7,94),(7,95),
(8,96),(8,97),(8,98),(8,99),(8,100),
(9,101),(9,102),(9,103),(9,104),(9,105),
(10,106),(10,107),(10,108),(10,109),(10,110);

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

-- Beatles (13)
INSERT INTO Participe VALUES
(1,61),(2,61),(3,61),(4,61),
(1,62),(2,62),(3,62),(4,62),
(1,63),(2,63),(3,63),(4,63),
(1,64),(2,64),(3,64),(4,64),
(1,65),(2,65),(3,65),(4,65);

-- Queen (14)
INSERT INTO Participe VALUES
(5,66),(6,66),(7,66),
(5,67),(6,67),(7,67),
(5,68),(6,68),(7,68),
(5,69),(6,69),(7,69),
(5,70),(6,70),(7,70);

-- Pink Floyd (15)
INSERT INTO Participe VALUES
(8,71),(9,71),
(8,72),(9,72),
(8,73),(9,73),
(8,74),(9,74),
(8,75),(9,75);

-- Daft Punk (16)
INSERT INTO Participe VALUES
(10,76),(11,76),
(10,77),(11,77),
(10,78),(11,78),
(10,79),(11,79),
(10,80),(11,80);

-- Coldplay (17)
INSERT INTO Participe VALUES
(12,81),(12,82),(12,83),(12,84),(12,85);

-- Radiohead (18)
INSERT INTO Participe VALUES
(14,86),(14,87),(14,88),(14,89),(14,90);

-- Nirvana (19)
INSERT INTO Participe VALUES
(15,91),(15,92),(15,93),(15,94),(15,95);

-- Led Zeppelin (20)
INSERT INTO Participe VALUES
(16,96),(17,96),
(16,97),(17,97),
(16,98),(17,98),
(16,99),(17,99),
(16,100),(17,100);

-- Arctic Monkeys (21)
INSERT INTO Participe VALUES
(18,101),(18,102),(18,103),(18,104),(18,105);

-- Imagine Dragons (22)
INSERT INTO Participe VALUES
(19,106),(19,107),(19,108),(19,109),(19,110);

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

-- Écoutes pour les morceaux 61 à 85
INSERT INTO Ecoute (pseudo, idMorceau, dureeEcoute, dateEcoute) VALUES
('melomane92',61,INTERVAL '00:03:11','2024-01-14 10:22:11'),
('rockfan',61,INTERVAL '00:02:58','2024-02-03 19:44:55'),
('queenfan',61,INTERVAL '00:03:20','2024-04-22 08:11:32'),

('jazzlover',62,INTERVAL '00:02:35','2024-03-18 17:05:01'),
('beatlemania',62,INTERVAL '00:02:10','2024-05-09 13:44:19'),
('indie_vibes',62,INTERVAL '00:02:56','2024-10-01 21:33:44'),
('lofi_dreams',62,INTERVAL '00:02:48','2025-02-15 09:12:00'),

('classicrock',63,INTERVAL '00:03:40','2024-06-12 15:14:10'),
('vinyl_addict',63,INTERVAL '00:03:01','2024-11-07 20:05:55'),
('melomane92',63,INTERVAL '00:03:22','2025-01-18 11:22:42'),

('electrohead',64,INTERVAL '00:02:55','2024-04-28 18:44:37'),
('rockfan',64,INTERVAL '00:02:39','2025-03-10 12:15:32'),
('beatlemania',64,INTERVAL '00:02:50','2025-05-02 14:18:00'),

('queenfan',65,INTERVAL '00:03:00','2024-02-14 20:01:11'),
('melomane92',65,INTERVAL '00:02:58','2025-06-18 09:43:22'),
('jazzlover',65,INTERVAL '00:03:03','2025-08-22 19:55:20'),

('rockfan',66,INTERVAL '00:03:01','2024-01-20 11:15:50'),
('queenfan',66,INTERVAL '00:03:10','2024-08-07 22:51:01'),
('vinyl_addict',66,INTERVAL '00:03:05','2025-09-14 17:44:33'),

('electrohead',67,INTERVAL '00:04:12','2024-02-02 15:45:15'),
('classicrock',67,INTERVAL '00:04:08','2024-11-15 07:33:58'),
('jazzlover',67,INTERVAL '00:04:16','2025-03-28 14:55:00'),

('queenfan',68,INTERVAL '00:03:00','2024-04-01 12:14:20'),
('indie_vibes',68,INTERVAL '00:03:01','2024-12-22 18:40:50'),
('rockfan',68,INTERVAL '00:03:02','2025-04-25 10:18:45'),

('melomane92',69,INTERVAL '00:04:11','2024-07-19 09:23:11'),
('classicrock',69,INTERVAL '00:04:08','2024-09-22 15:55:50'),
('queenfan',69,INTERVAL '00:04:10','2025-01-30 17:44:00'),

('queenfan',70,INTERVAL '00:03:26','2024-03-12 21:14:33'),
('rockfan',70,INTERVAL '00:03:20','2024-10-09 10:10:21'),
('lofi_dreams',70,INTERVAL '00:03:05','2025-03-05 22:14:40'),

('jazzlover',71,INTERVAL '00:11:45','2024-05-03 18:26:00'),
('indie_vibes',71,INTERVAL '00:13:20','2024-09-01 22:50:44'),
('classicrock',71,INTERVAL '00:12:00','2025-04-08 13:15:05'),

('vinyl_addict',72,INTERVAL '00:07:12','2024-07-12 12:14:22'),
('rockfan',72,INTERVAL '00:07:31','2025-02-14 11:55:35'),
('electrohead',72,INTERVAL '00:07:28','2025-06-09 16:44:03'),

('melomane92',73,INTERVAL '00:05:02','2024-04-10 17:17:11'),
('queenfan',73,INTERVAL '00:05:07','2024-11-13 08:50:12'),
('classicrock',73,INTERVAL '00:05:10','2025-03-12 15:22:44'),

('jazzlover',74,INTERVAL '00:05:35','2024-02-02 14:19:20'),
('beatlemania',74,INTERVAL '00:05:38','2025-05-05 18:44:11'),
('vinyl_addict',74,INTERVAL '00:05:20','2025-07-14 20:22:30'),

('indie_vibes',75,INTERVAL '00:12:25','2024-01-11 11:33:40'),
('electrohead',75,INTERVAL '00:12:02','2024-10-28 19:10:12'),
('lofi_dreams',75,INTERVAL '00:11:55','2025-02-01 13:40:44'),

('melomane92',76,INTERVAL '00:05:15','2024-03-14 21:10:55'),
('electrohead',76,INTERVAL '00:05:20','2024-07-30 18:59:11'),
('rockfan',76,INTERVAL '00:05:05','2025-01-18 09:14:20'),

('electrohead',77,INTERVAL '00:04:10','2024-01-28 14:00:40'),
('queenfan',77,INTERVAL '00:04:20','2024-09-22 21:22:19'),
('vinyl_addict',77,INTERVAL '00:04:15','2025-06-11 16:45:33'),

('electrohead',78,INTERVAL '00:04:43','2024-06-18 10:14:12'),
('lofi_dreams',78,INTERVAL '00:04:39','2024-12-27 23:40:59'),
('rockfan',78,INTERVAL '00:04:45','2025-05-21 19:30:22'),

('jazzlover',79,INTERVAL '00:04:40','2024-04-03 13:58:10'),
('indie_vibes',79,INTERVAL '00:04:50','2024-11-05 17:15:32'),
('electrohead',79,INTERVAL '00:04:49','2025-01-27 14:14:09'),

('electrohead',80,INTERVAL '00:04:43','2024-05-15 20:11:14'),
('lofi_dreams',80,INTERVAL '00:04:32','2024-09-20 12:44:55'),
('queenfan',80,INTERVAL '00:04:45','2025-06-19 08:40:22'),

('classicrock',81,INTERVAL '00:05:10','2024-03-18 12:14:10'),
('melomane92',81,INTERVAL '00:05:18','2024-11-02 16:40:21'),
('rockfan',81,INTERVAL '00:05:11','2025-04-20 19:33:47'),

('indie_vibes',82,INTERVAL '00:03:44','2024-02-14 21:20:20'),
('beatlemania',82,INTERVAL '00:03:50','2024-10-10 11:44:13'),
('vinyl_addict',82,INTERVAL '00:03:48','2025-03-09 14:10:45'),

('jazzlover',83,INTERVAL '00:04:55','2024-06-09 13:22:11'),
('queenfan',83,INTERVAL '00:04:59','2024-12-05 19:41:22'),
('melomane92',83,INTERVAL '00:04:50','2025-08-01 20:12:33'),

('rockfan',84,INTERVAL '00:05:00','2024-05-19 17:30:42'),
('classicrock',84,INTERVAL '00:05:08','2024-09-13 09:55:05'),
('jazzlover',84,INTERVAL '00:05:03','2025-03-22 15:44:50'),

('indie_vibes',85,INTERVAL '00:05:00','2024-03-22 20:19:33'),
('queenfan',85,INTERVAL '00:05:05','2024-11-21 12:40:14'),
('lofi_dreams',85,INTERVAL '00:05:07','2025-04-28 08:51:37');

-- Écoutes pour les morceaux 86 à 110
INSERT INTO Ecoute (pseudo, idMorceau, dureeEcoute, dateEcoute) VALUES
('indie_vibes',86,INTERVAL '00:03:55','2024-01-22 16:44:11'),
('jazzlover',86,INTERVAL '00:03:58','2024-11-03 09:51:30'),
('rockfan',86,INTERVAL '00:03:57','2025-03-24 20:14:05'),

('classicrock',87,INTERVAL '00:04:02','2024-02-18 14:33:19'),
('queenfan',87,INTERVAL '00:04:05','2024-10-12 22:12:41'),
('vinyl_addict',87,INTERVAL '00:04:09','2025-02-05 11:40:25'),

('melomane92',88,INTERVAL '00:04:12','2024-05-14 10:10:40'),
('electrohead',88,INTERVAL '00:04:15','2024-12-22 18:50:21'),
('beatlemania',88,INTERVAL '00:04:10','2025-06-27 17:55:45'),

('rockfan',89,INTERVAL '00:05:11','2024-06-20 20:14:22'),
('classicrock',89,INTERVAL '00:05:05','2025-01-09 09:42:11'),
('lofi_dreams',89,INTERVAL '00:05:03','2025-04-16 21:40:33'),

('indie_vibes',90,INTERVAL '00:04:45','2024-04-09 12:09:30'),
('melomane92',90,INTERVAL '00:04:48','2024-09-18 15:17:01'),
('vinyl_addict',90,INTERVAL '00:04:49','2025-03-19 19:22:44'),

('beatlemania',91,INTERVAL '00:03:30','2024-02-14 10:20:55'),
('rockfan',91,INTERVAL '00:03:36','2024-11-17 17:22:09'),
('indie_vibes',91,INTERVAL '00:03:34','2025-05-03 12:18:44'),

('electrohead',92,INTERVAL '00:03:51','2024-03-25 14:55:10'),
('jazzlover',92,INTERVAL '00:03:49','2024-08-19 10:45:18'),
('lofi_dreams',92,INTERVAL '00:03:52','2025-03-30 21:10:01'),

('rockfan',93,INTERVAL '00:04:35','2024-07-07 16:41:20'),
('classicrock',93,INTERVAL '00:04:38','2024-12-11 14:10:54'),
('queenfan',93,INTERVAL '00:04:39','2025-02-22 11:59:40'),

('melomane92',94,INTERVAL '00:02:50','2024-04-18 13:55:02'),
('vinyl_addict',94,INTERVAL '00:02:49','2024-10-28 19:07:42'),
('indie_vibes',94,INTERVAL '00:02:52','2025-06-15 16:14:11'),

('jazzlover',95,INTERVAL '00:03:49','2024-08-23 10:44:20'),
('beatlemania',95,INTERVAL '00:03:45','2025-01-13 18:55:32'),
('electrohead',95,INTERVAL '00:03:50','2025-07-29 20:19:11'),

('classicrock',96,INTERVAL '00:05:22','2024-03-02 15:03:10'),
('queenfan',96,INTERVAL '00:05:25','2024-09-14 21:48:50'),
('rockfan',96,INTERVAL '00:05:20','2025-04-21 12:31:12'),

('vinyl_addict',97,INTERVAL '00:07:21','2024-01-15 11:51:00'),
('lofi_dreams',97,INTERVAL '00:07:28','2024-11-03 23:55:34'),
('melomane92',97,INTERVAL '00:07:30','2025-02-08 14:12:17'),

('queenfan',98,INTERVAL '00:04:49','2024-05-31 08:30:55'),
('indie_vibes',98,INTERVAL '00:04:52','2024-10-17 10:55:12'),
('jazzlover',98,INTERVAL '00:04:50','2025-03-14 18:40:21'),

('rockfan',99,INTERVAL '00:03:52','2024-02-10 19:07:41'),
('classicrock',99,INTERVAL '00:03:55','2024-06-26 13:40:02'),
('electrohead',99,INTERVAL '00:03:53','2025-04-29 17:44:22'),

('beatlemania',100,INTERVAL '00:07:00','2024-03-28 14:25:20'),
('vinyl_addict',100,INTERVAL '00:07:03','2025-01-02 09:49:31'),
('lofi_dreams',100,INTERVAL '00:07:05','2025-06-11 18:43:14'),

('melomane92',101,INTERVAL '00:02:48','2024-06-16 20:34:41'),
('queenfan',101,INTERVAL '00:02:52','2024-12-12 13:19:20'),
('jazzlover',101,INTERVAL '00:02:55','2025-03-24 11:44:33'),

('rockfan',102,INTERVAL '00:03:24','2024-03-04 21:21:20'),
('electrohead',102,INTERVAL '00:03:26','2024-10-05 10:42:15'),
('indie_vibes',102,INTERVAL '00:03:28','2025-06-22 09:31:14'),

('beatlemania',103,INTERVAL '00:03:01','2024-01-09 18:44:19'),
('vinyl_addict',103,INTERVAL '00:03:03','2024-09-17 20:30:42'),
('classicrock',103,INTERVAL '00:03:05','2025-02-14 13:12:01'),

('queenfan',104,INTERVAL '00:04:11','2024-04-15 10:10:40'),
('jazzlover',104,INTERVAL '00:04:08','2024-07-28 12:50:22'),
('lofi_dreams',104,INTERVAL '00:04:09','2025-05-07 18:44:55'),

('indie_vibes',105,INTERVAL '00:03:20','2024-05-26 17:24:40'),
('rockfan',105,INTERVAL '00:03:26','2024-11-13 22:18:33'),
('melomane92',105,INTERVAL '00:03:23','2025-06-29 15:41:11'),

('electrohead',106,INTERVAL '00:03:47','2024-02-18 13:12:30'),
('classicrock',106,INTERVAL '00:03:52','2024-09-07 09:41:22'),
('queenfan',106,INTERVAL '00:03:49','2025-03-03 10:55:10'),

('vinyl_addict',107,INTERVAL '00:03:38','2024-03-22 16:22:10'),
('lofi_dreams',107,INTERVAL '00:03:37','2024-08-16 18:45:40'),
('rockfan',107,INTERVAL '00:03:40','2025-04-30 12:43:21'),

('melomane92',108,INTERVAL '00:04:11','2024-01-12 15:14:10'),
('indie_vibes',108,INTERVAL '00:04:15','2024-10-22 20:40:22'),
('queenfan',108,INTERVAL '00:04:14','2025-02-17 09:55:44'),

('beatlemania',109,INTERVAL '00:03:31','2024-04-18 19:30:20'),
('vinyl_addict',109,INTERVAL '00:03:30','2024-11-11 08:33:44'),
('lofi_dreams',109,INTERVAL '00:03:34','2025-08-03 17:22:00'),

('classicrock',110,INTERVAL '00:03:40','2024-05-20 21:18:10'),
('electrohead',110,INTERVAL '00:03:42','2024-08-29 14:00:55'),
('jazzlover',110,INTERVAL '00:03:45','2025-05-12 18:51:33');

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