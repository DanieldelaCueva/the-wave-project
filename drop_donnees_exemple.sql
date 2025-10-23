-- =======================================
-- VIDAGE COMPLET DES TABLES
-- (Sans supprimer la structure)
-- =======================================

-- On désactive temporairement les contraintes de clé étrangère
SET session_replication_role = replica;

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

-- On réactive les contraintes
SET session_replication_role = DEFAULT;

-- Vérification facultative
-- SELECT 'Tables vidées avec succès !' AS message;
