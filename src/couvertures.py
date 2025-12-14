from PIL import Image, ImageDraw
import io
import random
import psycopg2

import db

N_GROUPES = 12
N_ARTISTES = 26
N_ALBUMS = 25
TOTAL = N_GROUPES + N_ARTISTES + N_ALBUMS


# -----------------------
# 1. GENERER PN ABSTRAITS
# -----------------------

def generer_image_asbtraite(size=400):
    img = Image.new("RGB", (size, size), color=(0, 0, 0))
    d = ImageDraw.Draw(img)

    # Dessiner lignes aléatoires
    for _ in range(20):
        x1, y1 = random.randint(0, size), random.randint(0, size)
        x2, y2 = random.randint(0, size), random.randint(0, size)
        color = (
            random.randint(50, 255),
            random.randint(50, 255),
            random.randint(50, 255)
        )
        d.line((x1, y1, x2, y2), fill=color, width=random.randint(2, 8))

    # Sauvergarder en bytes
    buffer = io.BytesIO()
    img.save(buffer, format="PNG")
    return buffer.getvalue()


print(f"Génération de {TOTAL} images abstraites…")
images = [generer_image_asbtraite() for _ in range(TOTAL)]
print("   ✓ Images générées\n")

# Distribution
imgs_groupes = images[:N_GROUPES]
imgs_artistes = images[N_GROUPES:N_GROUPES + N_ARTISTES]
imgs_albums = images[N_GROUPES + N_ARTISTES:]


# -------------------------
# 2. INSERTION EN POSTGRES
# -------------------------

conn = db.connect()
cur = conn.cursor()

# --- Groupe ---
for i, img in enumerate(imgs_groupes, start=1):
    cur.execute(
        "UPDATE Groupe SET imCouverture = %s WHERE idgroupe = %s",
        (psycopg2.Binary(img), i)
    )
print("✓ Images insérées dans Groupe")

# --- Artiste ---
for i, img in enumerate(imgs_artistes, start=1):
    cur.execute(
        "UPDATE Artiste SET imCouverture = %s WHERE idartiste = %s",
        (psycopg2.Binary(img), i)
    )
print("✓ Images insérées dans Artiste")

# --- Album ---
for i, img in enumerate(imgs_albums, start=1):
    cur.execute(
        "UPDATE Album SET imCouverture = %s WHERE idalbum = %s",
        (psycopg2.Binary(img), i)
    )
print("✓ Images insérées dans Album")

conn.commit()
cur.close()
conn.close()

print("\nTerminé")
