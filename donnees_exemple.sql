-- =======================================
-- INSERTIONS DANS LES TABLES D'ENTITÉS
-- =======================================

-- 1️⃣ Artistes
INSERT INTO Artiste (nom, prenom, nationalite, dNaissance, dMort)
VALUES
('Lennon', 'John', 'Britannique', '1940-10-09', '1980-12-08'),
('McCartney', 'Paul', 'Britannique', '1942-06-18', NULL),
('Harrison', 'George', 'Britannique', '1943-02-25', '2001-11-29'),
('Starr', 'Ringo', 'Britannique', '1940-07-07', NULL),
('Mercury', 'Freddie', 'Britannique', '1946-09-05', '1991-11-24'),
('May', 'Brian', 'Britannique', '1947-07-19', NULL),
('Taylor', 'Roger', 'Britannique', '1949-07-26', NULL),
('Deacon', 'John', 'Britannique', '1951-08-19', NULL);

-- 2️⃣ Groupes
INSERT INTO Groupe (nom, dCreation, nationalite, genre)
VALUES
('The Beatles', '1960-01-01', 'Britannique', 'Rock'),
('Queen', '1970-01-01', 'Britannique', 'Rock');

-- 3️⃣ Rôles
INSERT INTO Role (descRole)
VALUES ('Chanteur'), ('Guitariste'), ('Batteur'), ('Bassiste');

-- 4️⃣ Albums
INSERT INTO Album (titre, dParution, descAlbum)
VALUES
('Abbey Road', '1969-09-26', 'Dernier album enregistré par les Beatles.'),
('A Night at the Opera', '1975-11-21', 'Album mythique de Queen.');

-- 5️⃣ Morceaux
INSERT INTO Morceau (titre, dureeMorceau, dPublication, paroles)
VALUES
('Come Together', '00:04:19', '1969-10-06', 'Here come old flat top...'),
('Something', '00:03:03', '1969-10-06', 'Something in the way she moves...'),
('Bohemian Rhapsody', '00:05:55', '1975-10-31', 'Is this the real life?...'),
('Love of My Life', '00:03:38', '1975-11-21', 'Love of my life, you’ve hurt me...');

-- 6️⃣ Utilisateurs
INSERT INTO Utilisateur (pseudo, mail, mPasse, dInscription)
VALUES
('alice', 'alice@example.com', 'motdepasse1', '2024-01-10'),
('bob', 'bob@example.com', 'motdepasse2', '2024-03-15'),
('charlie', 'charlie@example.com', 'motdepasse3', '2024-05-01');

-- 7️⃣ Playlists
INSERT INTO Playlist (titre, descPlaylist, visibilite)
VALUES
('Rock Classics', 'Les morceaux rock incontournables.', TRUE),
('Ballades', 'Mélodies douces pour se détendre.', TRUE);

-- =======================================
-- INSERTIONS DANS LES TABLES D'ASSOCIATIONS
-- =======================================

-- 🧩 Compose (Morceaux dans Albums)
INSERT INTO Compose (idMorceau, idAlbum, ordreDsAlbum)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 2);

-- 🧩 Publie (Groupes → Albums)
INSERT INTO Publie (idGroupe, idAlbum)
VALUES
(1, 1),
(2, 2);

-- 🧩 Joue (Groupes → Morceaux)
INSERT INTO Joue (idGroupe, idMorceau)
VALUES
(1, 1), (1, 2),
(2, 3), (2, 4);

-- 🧩 Participe (Artistes → Morceaux)
INSERT INTO Participe (idArtiste, idMorceau)
VALUES
(1, 1), (2, 1), (3, 1), (4, 1),
(1, 2), (2, 2), (3, 2), (4, 2),
(5, 3), (6, 3), (7, 3), (8, 3),
(5, 4), (6, 4), (7, 4), (8, 4);

-- 🧩 Appartient (Artistes → Groupes + Rôle)
INSERT INTO Appartient (idArtiste, idGroupe, idRole, dDebut)
VALUES
(1, 1, 1, '1960-01-01'),
(2, 1, 2, '1960-01-01'),
(3, 1, 2, '1960-01-01'),
(4, 1, 3, '1960-01-01'),
(5, 2, 1, '1970-01-01'),
(6, 2, 2, '1970-01-01'),
(7, 2, 3, '1970-01-01'),
(8, 2, 4, '1970-01-01');

-- 🧩 Cree (Utilisateur → Playlist)
INSERT INTO Cree (pseudo, idPlaylist)
VALUES
('alice', 1),
('bob', 2);

-- 🧩 Inclus (Morceaux dans Playlists)
INSERT INTO Inclus (idPlaylist, idMorceau, ordreDsPlaylist)
VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(2, 4, 2);

-- 🧩 Ecoute (Historique d’écoute)
INSERT INTO Ecoute (pseudo, idMorceau, dureeEcoute, dateEcoute)
VALUES
('alice', 1, '00:04:19', '2024-06-01 14:32:00'),
('bob', 3, '00:05:55', '2024-06-02 20:15:00'),
('charlie', 4, '00:03:38', '2024-06-03 10:05:00');

-- 🧩 SuitUtilisateur (abonnements entre utilisateurs)
INSERT INTO SuitUtilisateur (suivant, suivi, dDebut)
VALUES
('alice', 'bob', '2024-06-05'),
('bob', 'charlie', '2024-06-07');

-- 🧩 SuitGroupe (abonnements utilisateurs → groupes)
INSERT INTO SuitGroupe (pseudo, idGroupe, dDebut)
VALUES
('alice', 1, '2024-06-10'),
('bob', 2, '2024-06-10');
