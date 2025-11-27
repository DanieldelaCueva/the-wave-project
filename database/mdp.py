from passlib.hash import pbkdf2_sha256
import psycopg2
import psycopg2.extras

# Datos a insertar (user, mail, contraseña, fecha)
usuarios = [
    ('melomane92', 'melomane92@mail.com', 'pass1', '2023-01-12'),
    ('rockfan', 'rockfan@mail.com', 'pass2', '2023-03-10'),
    ('jazzlover', 'jazzlover@mail.com', 'pass3', '2023-05-22'),
    ('beatlemania', 'beatlemania@mail.com', 'password', '2023-07-15'),
    ('vinyl_addict', 'vinyl_addict@mail.com', 'pass5', '2023-09-01'),
    ('electrohead', 'electrohead@mail.com', 'pass6', '2024-02-09'),
    ('queenfan', 'queenfan@mail.com', 'pass7', '2024-03-12'),
    ('classicrock', 'classicrock@mail.com', 'pass8', '2024-04-01'),
    ('indie_vibes', 'indie_vibes@mail.com', 'pass9', '2024-06-23'),
    ('lofi_dreams', 'lofi_dreams@mail.com', 'pass10', '2024-08-30')
]

# Configuración de conexión
conn = psycopg2.connect(
    host = 'sqledu.univ-eiffel.fr',
    dbname = 'delacuevapuert_db',
    password = 'CooperZar!73#',
    cursor_factory = psycopg2.extras.NamedTupleCursor
)

cur = conn.cursor()

query = """
    UPDATE Utilisateur SET mPasse = %s WHERE pseudo = %s
"""

for pseudo, mail, pwd, fecha in usuarios:
    hashed = pbkdf2_sha256.hash(pwd)  # Cifrado seguro
    cur.execute(query, (hashed, pseudo))

conn.commit()
cur.close()
conn.close()

print("Chiffrement des mots de passe terminé")
