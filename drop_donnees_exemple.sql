-- =======================================
-- VIDAGE COMPLET DES TABLES
-- (Sans supprimer la structure)
-- =======================================

-- On TRUNCATE les tables dans l’ordre approprié
TRUNCATE TABLE
    SuitGroupe,
    SuitUtilisateur,
    Ecoute,
    Inclus,
    Cree,
    Appartient,
    Participe,
    Joue,
    Publie,
    Compose,
    Playlist,
    Utilisateur,
    Album,
    Role,
    Groupe,
    Morceau,
    Artiste
RESTART IDENTITY;
