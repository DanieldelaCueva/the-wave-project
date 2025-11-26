"""
IMPORTATION DES BIBLIOTHÈQUES NÉCESSAIRES
"""
from flask import Flask, render_template, request, redirect, session,url_for
import psycopg2
import psycopg2.extras

import secrets

from keys import DB_NAME, DB_PASSWORD

"""
FONCTIONS AUXILIAIRES
"""
def verifier_si_connecte():
    utilisateur = session.get("pseudo")
    if utilisateur == None:
        return redirect(url_for("/connexion"))


"""
PARAMÉTRAGE DE LA BASE DE DONNÉES
"""
def connect():
    """
    Changer ceci pour le rendu final
    """
    conn = psycopg2.connect(
        host = 'sqledu.univ-eiffel.fr',
        dbname = DB_NAME,
        password = DB_PASSWORD,
        cursor_factory = psycopg2.extras.NamedTupleCursor,
    )
    conn.autocommit = True
    return conn

"""
APPLICATION WEB
"""
app = Flask(__name__)

app.secret_key = b'%s' % secrets.token_bytes()

@app.route('/')
def accueil():
    verifier_si_connecte()

    derniers_albums = ()
    groupes_plus_suivis = ()
    morceaux_plus_ecoutes = ()
    
    with connect() as conn:
        with conn.cursor() as cur1:
            cur1.execute("SELECT titre, encode(album.imCouverture, 'base64') AS couverture, nom AS nomGroupe FROM album NATURAL JOIN publie JOIN groupe ON publie.idgroupe = groupe.idgroupe ORDER BY dParution DESC LIMIT 5")
            derniers_albums = cur1.fetchall()
        with conn.cursor() as cur2:
            cur2.execute("SELECT nom, encode(imCouverture, 'base64') AS couverture, count(pseudo) as abonnes FROM groupe NATURAL JOIN suitGroupe GROUP BY idGroupe ORDER BY abonnes DESC LIMIT 3")
            groupes_plus_suivis = cur2.fetchall()
        with conn.cursor() as cur3:
            cur3.execute("SELECT titre, sum(dureeEcoute) as tpsEcoute FROM morceau NATURAL JOIN ecoute GROUP BY idMorceau ORDER BY tpsEcoute DESC LIMIT 5")
            morceaux_plus_ecoutes = cur3.fetchall()
    return render_template('accueil.html', derniers_albums = derniers_albums, groupes_plus_suivis = groupes_plus_suivis, morceaux_plus_ecoutes = morceaux_plus_ecoutes)

@app.route('/connexion')
def connexion():
    if session.get("pseudo") == None:
        return redirect(url_for("/accueil"))
    return render_template('connexion.html', etat=0)

@app.route('/authentication', methods = ['POST'])
def authentication():
    pseudo = request.form.get("pseudo")
    mdp = request.form.get("mdp")
    with connect() as conn:
        with conn.cursor() as cur:
            cur.execute("SELECT mpasse FROM utilisateur WHERE pseudo='%s'" % pseudo)
            resultat = cur.fetchone()
            print(resultat.mpasse)
            if resultat == None:
                return render_template('connexion.html', etat=1)
            elif mdp == resultat.mpasse:
                session['pseudo'] = pseudo
                return redirect(url_for('accueil'))
            else:
                return render_template('connexion.html', etat=1)




@app.route('/recherche')
def recherche():
    q = request.args.get('q','')
    results = []
    return render_template('recherche.html', q=q, results=results)

@app.route('/profil')
def profil():
    return render_template('profil.html', top_tracks=[], history=[], playlists=[])

if __name__ == '__main__':
    app.run(debug=True)
