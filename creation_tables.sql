-- =============================
-- TABLES D'ENTITÉS
-- =============================

CREATE TABLE Artiste (
    idArtiste       SERIAL PRIMARY KEY,
    nom             VARCHAR(100) NOT NULL,
    prenom          VARCHAR(100),
    nationalite     VARCHAR(100),
    dNaissance      DATE,
    dMort           DATE,
    imCouverture    BYTEA,
    CONSTRAINT dateCoherente CHECK (dMort IS NULL OR dNaissance IS NULL OR dNaissance <= dMort)
);

CREATE TABLE Morceau (
    idMorceau       SERIAL PRIMARY KEY,
    titre           VARCHAR(200) NOT NULL,
    dureeMorceau    INTERVAL,         
    dPublication    DATE,
    paroles         TEXT
);

CREATE TABLE Groupe (
    idGroupe        SERIAL PRIMARY KEY,
    nom             VARCHAR(200) UNIQUE NOT NULL,
    dCreation       DATE,
    nationalite     VARCHAR(100),
    genre           VARCHAR(100),
    imCouverture    BYTEA
);

CREATE TABLE Role (
    idRole          SERIAL PRIMARY KEY,
    descRole        VARCHAR(50) UNIQUE
);

CREATE TABLE Album (
    idAlbum         SERIAL PRIMARY KEY,
    titre           VARCHAR(200) NOT NULL,
    dParution       DATE,
    imCouverture    BYTEA,
    descAlbum       TEXT
);

CREATE TABLE Utilisateur (
    pseudo          VARCHAR(100) PRIMARY KEY,
    mail            VARCHAR(255) UNIQUE NOT NULL,
    mPasse          VARCHAR(255) NOT NULL,
    dInscription    DATE NOT NULL
);

CREATE TABLE Playlist (
    idPlaylist      SERIAL PRIMARY KEY,
    titre           VARCHAR(200) NOT NULL,
    descPlaylist    TEXT,
    visibilite      BOOLEAN DEFAULT TRUE,
    dCreation       DATE DEFAULT CURRENT_DATE,
    pseudoCreateur        VARCHAR(100) NOT NULL,
    FOREIGN KEY (pseudoCreateur) REFERENCES Utilisateur(pseudo)
);

-- =============================
-- TABLES D'ASSOCIATIONS
-- =============================

CREATE TABLE Compose (
    idMorceau       INT,
    idAlbum         INT,
    ordreDsAlbum    INT NOT NULL,
    PRIMARY KEY (idMorceau, idAlbum),
    FOREIGN KEY (idMorceau) REFERENCES Morceau(idMorceau)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (idAlbum) REFERENCES Album(idAlbum)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Publie (
    idGroupe        INT,
    idAlbum         INT,
    PRIMARY KEY (idGroupe, idAlbum),
    FOREIGN KEY (idGroupe) REFERENCES Groupe(idGroupe)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (idAlbum) REFERENCES Album(idAlbum)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Joue (
    idGroupe        INT,
    idMorceau       INT,
    PRIMARY KEY (idGroupe, idMorceau),
    FOREIGN KEY (idGroupe) REFERENCES Groupe(idGroupe)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (idMorceau) REFERENCES Morceau(idMorceau)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Participe (
    idArtiste       INT,
    idMorceau       INT,
    PRIMARY KEY (idArtiste, idMorceau),
    FOREIGN KEY (idArtiste) REFERENCES Artiste(idArtiste)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (idMorceau) REFERENCES Morceau(idMorceau)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Appartient (
    idArtiste       INT,
    idGroupe        INT,
    idRole          INT,
    dDebut          DATE NOT NULL,
    dFin            DATE,
    CONSTRAINT dateCoherente CHECK (dFin IS NULL OR dDebut <= dFin),
    PRIMARY KEY (idArtiste, idGroupe, idRole),
    FOREIGN KEY (idArtiste) REFERENCES Artiste(idArtiste)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (idGroupe) REFERENCES Groupe(idGroupe)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (idRole) REFERENCES Role(idRole)
);

CREATE TABLE Inclus (
    idPlaylist      INT,
    idMorceau       INT,
    ordreDsPlaylist INT NOT NULL,
    PRIMARY KEY (idPlaylist, idMorceau),
    FOREIGN KEY (idPlaylist) REFERENCES Playlist(idPlaylist)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (idMorceau) REFERENCES Morceau(idMorceau)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Ecoute (
    pseudo          VARCHAR(50),
    idMorceau       INT,
    dureeEcoute     INTERVAL,
    dateEcoute      TIMESTAMP NOT NULL,
    PRIMARY KEY (pseudo, idMorceau, dateEcoute),
    FOREIGN KEY (pseudo) REFERENCES Utilisateur(pseudo),
    FOREIGN KEY (idMorceau) REFERENCES Morceau(idMorceau)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE SuitUtilisateur (
    suivant         VARCHAR(50),
    suivi           VARCHAR(50),
    dDebut          DATE NOT NULL,
    dFin            DATE,
    CONSTRAINT dateCoherente CHECK (dFin IS NULL OR dDebut <= dFin),
    PRIMARY KEY (suivant, suivi, dDebut),
    FOREIGN KEY (suivant) REFERENCES Utilisateur(pseudo)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (suivi) REFERENCES Utilisateur(pseudo)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE SuitGroupe (
    pseudo          VARCHAR(50),
    idGroupe        INT,
    dDebut          DATE NOT NULL,
    dFin            DATE,
    CONSTRAINT dateCoherente CHECK (dFin IS NULL OR dDebut <= dFin),
    PRIMARY KEY (pseudo, idGroupe, dDebut),
    FOREIGN KEY (pseudo) REFERENCES Utilisateur(pseudo)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (idGroupe) REFERENCES Groupe(idGroupe)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- =============================
-- VUE POUR LES STATS
-- =============================

CREATE VIEW vue_stats_morceaux AS
SELECT 
    t1.idMorceau,
    titre AS titre_morceau,
    nom AS nom_groupe,

    COUNT(dateEcoute) AS nb_ecoutes_uniques,
    COUNT(DISTINCT pseudo) AS nb_personnes_ayant_ecoute,
    
    -- sous-requête pour compter les partages publics
    (
        SELECT COUNT(idPlaylist)
        FROM (Inclus
        NATURAL JOIN Playlist) as t3
        WHERE visibilite = TRUE AND t1.idMorceau = t3.idMorceau
    ) AS nb_partages_publics,

    ROUND(
        0.10 * COUNT(DISTINCT pseudo)
        + 0.01 * (COUNT(dateEcoute) - COUNT(DISTINCT pseudo)),
        2
    ) AS remuneration_euros

FROM 
    
    (Morceau 
        NATURAL JOIN Joue 
        NATURAL JOIN Groupe) AS t1
    LEFT JOIN Ecoute AS t2 ON t1.idMorceau = t2.idMorceau
    

GROUP BY 
    t1.idMorceau, titre, nom;


