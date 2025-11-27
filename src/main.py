"""
IMPORTATION DES BIBLIOTHÈQUES NÉCESSAIRES
"""
from flask import Flask, render_template, request, redirect, session,url_for
import psycopg2
import psycopg2.extras
import secrets
from passlib.hash import pbkdf2_sha256

import db

"""
FONCTIONS AUXILIAIRES
"""
def verifier_si_connecte():
    utilisateur = session.get("pseudo")
    print(utilisateur)
    if utilisateur == None:
        return False
    else:
        return True

"""
APPLICATION WEB
"""
app = Flask(__name__)

app.secret_key = b'%s' % secrets.token_bytes()

@app.route('/')
def accueil():
    if not verifier_si_connecte():
        return redirect(url_for("connexion"))

    derniers_albums = ()
    groupes_plus_suivis = ()
    morceaux_plus_ecoutes = ()
    
    with db.connect() as conn:
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
    if session.get("pseudo") != None:
        return redirect(url_for("accueil"))
    return render_template('connexion.html', etat=0)

@app.route('/authentication', methods = ['POST'])
def authentication():
    pseudo = request.form.get("pseudo")
    mdp = request.form.get("mdp")
    with db.connect() as conn:
        with conn.cursor() as cur:
            cur.execute("SELECT mpasse FROM utilisateur WHERE pseudo='%s'" % pseudo)
            resultat = cur.fetchone()
            print(resultat.mpasse)
            if resultat == None:
                return render_template('connexion.html', etat=1)
            elif pbkdf2_sha256.verify(mdp,resultat.mpasse):
                session['pseudo'] = pseudo
                return redirect(url_for('accueil'))
            else:
                return render_template('connexion.html', etat=1)

@app.route('/deconnexion')
def deconnexion():
    if not verifier_si_connecte():
        return redirect(url_for("connexion"))
    session.pop("pseudo")
    return redirect(url_for("connexion"))


@app.route('/profil')
def profil():
    if not verifier_si_connecte():
        return redirect(url_for("connexion"))

    pseudo = session.get("pseudo")

    return render_template('profil.html', pseudo = pseudo, top_tracks=[], history=[], playlists=[])


@app.route('/recherche')
def recherche():
    q = request.args.get('q','')
    results = []
    return render_template('recherche.html', q=q, results=results)

if __name__ == '__main__':
    app.run(debug=True)
