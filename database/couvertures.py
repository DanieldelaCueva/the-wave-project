from PIL import Image, ImageDraw
import io
import random
import psycopg2
import psycopg2.extras

# -------------------------
# CONFIG DB
# -------------------------
DB = {
    "dbname": "delacuevapuert_db",
    "user": "postgres",
    "password": "admin",
    "host": "localhost",
    "port": 5432
}

# Necesidades
N_GROUPES = 12
N_ARTISTES = 26
N_ALBUMS = 14
TOTAL = N_GROUPES + N_ARTISTES + N_ALBUMS


# -------------------------
# 1. GENERAR PNG ABSTRACTOS
# -------------------------

def generar_imagen_abstracta(size=400):
    img = Image.new("RGB", (size, size), color=(0, 0, 0))
    d = ImageDraw.Draw(img)

    # Dibujar líneas aleatorias
    for _ in range(20):
        x1, y1 = random.randint(0, size), random.randint(0, size)
        x2, y2 = random.randint(0, size), random.randint(0, size)
        color = (
            random.randint(50, 255),
            random.randint(50, 255),
            random.randint(50, 255)
        )
        d.line((x1, y1, x2, y2), fill=color, width=random.randint(2, 8))

    # Guardar en bytes
    buffer = io.BytesIO()
    img.save(buffer, format="PNG")
    return buffer.getvalue()


print(f"Generando {TOTAL} imágenes abstractas…")
imagenes = [generar_imagen_abstracta() for _ in range(TOTAL)]
print("   ✓ Imágenes generadas\n")

# Distribuir
imgs_groupes = imagenes[:N_GROUPES]
imgs_artistes = imagenes[N_GROUPES:N_GROUPES + N_ARTISTES]
imgs_albums = imagenes[N_GROUPES + N_ARTISTES:]


# -------------------------
# 2. INSERTAR EN POSTGRES
# -------------------------

conn = psycopg2.connect(**DB)
cur = conn.cursor()

# --- Groupe ---
for i, img in enumerate(imgs_groupes, start=1):
    cur.execute(
        "UPDATE Groupe SET imCouverture = %s WHERE idgroupe = %s",
        (psycopg2.Binary(img), i)
    )
print("✓ Imágenes insertadas en Groupe")

# --- Artiste ---
for i, img in enumerate(imgs_artistes, start=1):
    cur.execute(
        "UPDATE Artiste SET imCouverture = %s WHERE idartiste = %s",
        (psycopg2.Binary(img), i)
    )
print("✓ Imágenes insertadas en Artiste")

# --- Album ---
for i, img in enumerate(imgs_albums, start=1):
    cur.execute(
        "UPDATE Album SET imCouverture = %s WHERE idalbum = %s",
        (psycopg2.Binary(img), i)
    )
print("✓ Imágenes insertadas en Album")

conn.commit()
cur.close()
conn.close()

print("\n🎉 ¡Proceso completado! 52 imágenes abstractas añadidas a la base de datos.")
