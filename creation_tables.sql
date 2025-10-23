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
    pseudo          VARCHAR(50) PRIMARY KEY,
    mail            VARCHAR(150) UNIQUE NOT NULL,
    mPasse          VARCHAR(255) NOT NULL,
    dInscription    DATE NOT NULL
);

CREATE TABLE Playlist (
    idPlaylist      SERIAL PRIMARY KEY,
    titre           VARCHAR(200) NOT NULL,
    descPlaylist    TEXT,
    visibilite      BOOLEAN DEFAULT TRUE,
    dCreation       DATE DEFAULT CURRENT_DATE
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
        ON UPDATE CASCADE ON DELETE SET NULL,
);

CREATE TABLE Cree (
    pseudo          VARCHAR(50),
    idPlaylist      INT,
    PRIMARY KEY (pseudo, idPlaylist),
    FOREIGN KEY (pseudo) REFERENCES Utilisateur(pseudo)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (idPlaylist) REFERENCES Playlist(idPlaylist)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Inclus (
    idPlaylist      INT,
    idMorceau       INT,
    ordreDsPlaylist INT,
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
    PRIMARY KEY (pseudo, idMorceau),
    FOREIGN KEY (pseudo) REFERENCES Utilisateur(pseudo)
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (idMorceau) REFERENCES Morceau(idMorceau)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE SuitUtilisateur (
    suivant         VARCHAR(50),
    suivi           VARCHAR(50),
    dDebut          DATE NOT NULL,
    dFin            DATE,
    CONSTRAINT dateCoherente CHECK (dFin IS NULL OR dDebut <= dFin),
    PRIMARY KEY (suivant, suivi),
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
    PRIMARY KEY (pseudo, idGroupe),
    FOREIGN KEY (pseudo) REFERENCES Utilisateur(pseudo)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (idGroupe) REFERENCES Groupe(idGroupe)
        ON UPDATE CASCADE ON DELETE CASCADE
);
