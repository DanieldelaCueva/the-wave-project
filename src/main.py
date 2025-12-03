"""
IMPORTATION DES BIBLIOTHÈQUES NÉCESSAIRES
"""
from flask import Flask, render_template, request, redirect, session,url_for
import psycopg2
import psycopg2.extras
import secrets
import random

from passlib.hash import pbkdf2_sha256

from functools import wraps

import db

"""
FONCTIONS AUXILIAIRES
"""
def validation_connexion(f):
    """
    Décorateur (outil avancé pour le cours de BDD) qui va permettre de vérifier de façon 
    plus simple si l'utilisateur est connecté et rendre son pseudo dans les routes.
    """
    @wraps(f)
    def wrapper(*args, **kwargs):
        pseudo = session.get("pseudo")
        if pseudo == None:
            # Si aucun utilisateur en session, on redirige vers la page de connexion.
            # Sinon, on appelle la fonction en injectant directement le pseudo.
            return redirect(url_for("connexion"))
        else:
            return f(pseudo=pseudo, *args, **kwargs)
    return wrapper

"""
APPLICATION WEB
"""
app = Flask(__name__)

app.secret_key = b'%s' % secrets.token_bytes()

@app.route('/')
@validation_connexion
def accueil(pseudo):
    with db.connect() as conn:
        with conn.cursor() as cur1:
            cur1.execute("""SELECT idAlbum, titre, encode(album.imCouverture, 'base64') AS couverture, nom AS nomGroupe 
                         FROM album NATURAL JOIN publie JOIN groupe ON publie.idgroupe = groupe.idgroupe 
                         ORDER BY dParution DESC LIMIT 5""")
            derniers_albums = cur1.fetchall()
        with conn.cursor() as cur2:
            cur2.execute("""SELECT idGroupe, nom, encode(imCouverture, 'base64') AS couverture, count(pseudo) as abonnes 
                         FROM groupe NATURAL JOIN suitGroupe 
                         GROUP BY idGroupe 
                         ORDER BY abonnes DESC LIMIT 3""")
            groupes_plus_suivis = cur2.fetchall()
        with conn.cursor() as cur3:
            cur3.execute("""SELECT idMorceau, titre, sum(dureeEcoute) as tpsEcoute, nom AS groupe
                         FROM morceau NATURAL JOIN ecoute NATURAL JOIN joue NATURAL JOIN groupe
                         GROUP BY (idMorceau, groupe) 
                         ORDER BY tpsEcoute DESC LIMIT 5""")
            morceaux_plus_ecoutes = cur3.fetchall()
    return render_template('accueil.html', derniers_albums = derniers_albums, groupes_plus_suivis = groupes_plus_suivis, morceaux_plus_ecoutes = morceaux_plus_ecoutes)

@app.route('/connexion')
def connexion():
    if session.get("pseudo") != None:
        return redirect(url_for("accueil"))
    return render_template('authentication/connexion.html', etat=0)

@app.route('/authentication', methods = ['POST'])
def authentication():
    pseudo = request.form.get("pseudo")
    mdp = request.form.get("mdp")
    with db.connect() as conn:
        with conn.cursor() as cur:
            cur.execute("SELECT mpasse FROM utilisateur WHERE pseudo=%s", (pseudo,))
            resultat = cur.fetchone()
            if resultat == None:
                return render_template('authentication/connexion.html', etat=1)
            elif pbkdf2_sha256.verify(mdp,resultat.mpasse):
                session['pseudo'] = pseudo
                return redirect(url_for('accueil'))
            else:
                return render_template('authentication/connexion.html', etat=1)

@app.route('/deconnexion')
@validation_connexion
def deconnexion(pseudo):
    session.pop("pseudo")
    return redirect(url_for("connexion"))

@app.route('/inscription')
def inscription():
    if session.get("pseudo") != None:
        return redirect(url_for("accueil"))
    return render_template('authentication/inscription.html', etat=0)

@app.route('/traitement_inscription', methods=['POST'])
def traitement_inscription():
    pseudo = request.form.get("pseudo")
    email = request.form.get("email")
    mdp1 = request.form.get("mdp")
    mdp2 = request.form.get("mdp_confirm")
    with db.connect() as conn:
        cur1 = conn.cursor()
        cur1.execute("SELECT pseudo FROM utilisateur WHERE pseudo=%s", (pseudo,))
        if not cur1.fetchone():
            cur1.close()
            cur2 = conn.cursor()
            cur2.execute("SELECT mail FROM utilisateur WHERE mail = %s", (email,))
            if not cur2.fetchone():
                cur2.close()
                if mdp1 and mdp1 == mdp2:
                    hashed = pbkdf2_sha256.hash(mdp1)
                    with conn.cursor() as cur3:
                        cur3.execute("""INSERT INTO utilisateur VALUES (%s, %s, %s, CURRENT_DATE)""", (pseudo, email, hashed))
                        return redirect(url_for("connexion"))
                else:
                    return render_template('authentication/inscription.html', etat=3) # erreur: les mdp ne coincident pas
            else:
                cur2.close()
                return render_template('authentication/inscription.html', etat=2) # erreur: l'email existe déjà
        else:
            cur1.close()
            return render_template('authentication/inscription.html', etat=1) # erreur: le pseudo existe déjà

@app.route('/playlist/<int:idplaylist>')
@validation_connexion
def playlist(pseudo, idplaylist):
    with db.connect() as conn:
        with conn.cursor() as cur1:
            cur1.execute("""SELECT * 
                            FROM playlist
                            WHERE idplaylist = %s""", (idplaylist,))
            playlist = cur1.fetchone()
        with conn.cursor() as cur2:
            cur2.execute("""SELECT idmorceau, titre, dureemorceau, nom as groupe
                            FROM inclus NATURAL JOIN morceau NATURAL JOIN joue NATURAL JOIN groupe
                            WHERE idplaylist = %s
                            ORDER BY ordredsplaylist;""", (idplaylist,))
            morceaux = cur2.fetchall()
    return render_template("general/playlist.html", playlist = playlist, morceaux = morceaux)

@app.route('/supprimer_morceau_playlist')
@validation_connexion
def supprimer_morceau_playlist(pseudo):
    idmorceau = request.args.get("idmorceau")
    idplaylist = request.args.get("idplaylist")
    with db.connect() as conn:
        with conn.cursor() as cur1:
            cur1.execute("""SELECT pseudoCreateur
                            FROM playlist
                            WHERE idPlaylist = %s """, (idplaylist,))
            if pseudo == cur1.fetchone().pseudocreateur:
                with conn.cursor() as cur2:
                    cur2.execute("""DELETE FROM inclus WHERE idPlaylist = %s AND idMorceau = %s""", (idplaylist, idmorceau))
    return redirect(url_for('playlist', idplaylist=idplaylist))

@app.route('/profil')
@validation_connexion
def profil(pseudo):
    with db.connect() as conn:
        with conn.cursor() as cur1:
            cur1.execute("""SELECT idMorceau, titre, nom AS groupe, sum(dureeEcoute) AS tpsEcoute 
                            FROM morceau NATURAL JOIN ecoute NATURAL JOIN joue NATURAL JOIN groupe
                            WHERE pseudo = %s 
                            GROUP BY (idMorceau, groupe) 
                            ORDER BY tpsEcoute DESC LIMIT 5;""", (pseudo, ))
            morceaux_plus_ecoutes = cur1.fetchall()
        with conn.cursor() as cur2:
            cur2.execute("""SELECT idMorceau, titre, nom AS groupe, dateEcoute::date
                            FROM morceau NATURAL JOIN ecoute NATURAL JOIN joue NATURAL JOIN groupe
                            WHERE pseudo = %s
                            ORDER BY dateEcoute DESC LIMIT 5;""", (pseudo, ))
            dernieres_ecoutes = cur2.fetchall()
        with conn.cursor() as cur3:
            # on fait LEFT JOIN au cas où la playlist ne contient pas de morceaux
            cur3.execute("""SELECT playlist.idPlaylist, titre, visibilite, count(idMorceau) as nbMorceaux
                            FROM playlist LEFT JOIN inclus ON inclus.idPlaylist = playlist.idPlaylist
                            WHERE pseudoCreateur = %s
			                GROUP BY playlist.idPlaylist
                            ORDER BY dCreation DESC LIMIT 5;""", (pseudo,))
            playlists = cur3.fetchall()
        with conn.cursor() as cur4:
            cur4.execute("""SELECT count(suivant)
                         FROM suitUtilisateur
                         WHERE suivi = %s AND dFin IS NULL""", (pseudo,))
            abonnes = cur4.fetchone().count
        with conn.cursor() as cur5:
            cur5.execute("""SELECT idMorceau, titre, nom AS groupe, dateEcoute::date, pseudo AS utilisateur
                            FROM morceau NATURAL JOIN ecoute NATURAL JOIN joue NATURAL JOIN groupe
                            WHERE pseudo IN (
						                        SELECT suivi
						                        FROM suitUtilisateur
						                        WHERE suivant = %s AND dFin IS NULL
					                        )
                            ORDER BY dateEcoute DESC LIMIT 5;""", (pseudo,))
            dernieres_ecoutes_suivis = cur5.fetchall()
        with conn.cursor() as cur5:
            cur5.execute("""SELECT idMorceau, titre, nom AS groupe, dPublication::date
                            FROM groupe NATURAL JOIN joue NATURAL JOIN morceau
                            WHERE idGroupe IN (
						SELECT idGroupe
						FROM suitGroupe
						WHERE pseudo = %s AND dFin IS NULL
					    )
                            ORDER BY dPublication DESC LIMIT 5;""", (pseudo,))
            dernieres_publications_groupes_suivis = cur5.fetchall()
        
    return render_template('utilisateur/profil.html', pseudo = pseudo, abonnes=abonnes, morceaux_plus_ecoutes = morceaux_plus_ecoutes, dernieres_ecoutes=dernieres_ecoutes, playlists=playlists, dernieres_ecoutes_suivis=dernieres_ecoutes_suivis, dernieres_publications_groupes_suivis=dernieres_publications_groupes_suivis)

@app.route('/supprimer_playlist')
@validation_connexion
def supprimer_playlist(pseudo):

    with db.connect() as conn:
        with conn.cursor() as cur:
            cur.execute("""SELECT idPlaylist, titre
                        FROM playlist
                        WHERE pseudoCreateur = %s""", (pseudo,))
            playlists = cur.fetchall()
    return render_template('utilisateur/supprimer_playlist.html', playlists = playlists)

@app.route('/suppression_playlist', methods = ['POST'])
@validation_connexion
def suppression_playlist(pseudo):
    id_playlist = request.form.get("idplaylist_suppr")
    with db.connect() as conn:
        with conn.cursor() as cur1:
            cur1.execute("""SELECT pseudoCreateur
                         FROM playlist
                         WHERE idPlaylist = %s""", (id_playlist,))
            createur = cur1.fetchone().pseudocreateur
            if createur == pseudo:
                with conn.cursor() as cur2:
                    cur2.execute("""DELETE FROM playlist WHERE idPlaylist = %s""", (id_playlist,))
    return redirect(url_for("profil"))

@app.route('/creer_playlist')
@validation_connexion
def creer_playlist(pseudo):
    return render_template("utilisateur/creer_playlist.html", pseudo = pseudo)

@app.route('/creation_playlist', methods = ['POST'])
@validation_connexion
def creation_playlist(pseudo):
    titre = request.form.get("titre")
    description = request.form.get("description")
    visibilite = bool(request.form.get("visibilité"))

    if titre:
        with db.connect() as conn:
            # idPlaylist est serial et dCreation est now par défaut
            with conn.cursor() as cur1:
                cur1.execute("""INSERT INTO playlist (titre, descPlaylist, visibilite, pseudoCreateur)
                             VALUES (%s, %s, %s, %s)""", (titre, description, visibilite, pseudo))
                return redirect(url_for("profil"))
    else:
        return redirect(url_for("creer_playlist"))
    
@app.route('/suggestions')
@validation_connexion
def suggestions(pseudo):
    with db.connect() as conn:
        with conn.cursor() as cur1:
            cur1.execute("""SELECT idArtiste, prenom ||' '|| nom AS nom, count(*) AS nb_ecoutes
                         FROM ecoute NATURAL JOIN participe NATURAL JOIN artiste
                         WHERE pseudo = %s
                         GROUP BY (idArtiste, prenom, nom)
                         HAVING count(*) >= 3
                         """, (pseudo,))
            artistes_tres_ecoutes = cur1.fetchall()
            if artistes_tres_ecoutes:
                # on choisit quel des artistes très écoutés va être utilisé pour la recommendation
                artiste_utilise = artistes_tres_ecoutes[random.randint(0,len(artistes_tres_ecoutes)-1)]
            
                with conn.cursor() as cur2:
                    # on selectionne les morceaux joués par cet artiste sauf les deux plus écoutés par l'utilisateur
                    cur2.execute("""(SELECT idMorceau, titre, nom AS groupe
                    FROM morceau NATURAL JOIN participe NATURAL JOIN joue NATURAL JOIN groupe
                    WHERE idArtiste = %s)
                    EXCEPT
                    (SELECT idMorceau, titre, nom AS groupe
                    FROM morceau NATURAL JOIN ecoute NATURAL JOIN participe NATURAL JOIN joue NATURAL JOIN groupe
                    WHERE pseudo = %s AND idArtiste = %s
                    GROUP BY (idMorceau, titre, groupe.nom)
                    ORDER BY sum(dureeEcoute) DESC LIMIT 2);
                    """, (artiste_utilise.idartiste, pseudo, artiste_utilise.idartiste))
                    morceaux = cur2.fetchall()
                    suggestion_1 = {
                        "nom_artiste" : artiste_utilise.nom,
                        "morceaux" : morceaux
                    }
            else:
                suggestion_1 = {}
        with conn.cursor() as cur3:
            # sélectionne les morceaux des groupes suivis, enlève les deux plus écoutés et ordonne aléatoirement 
            cur3.execute("""SELECT *
            FROM (
                SELECT idMorceau, titre, groupe
                FROM (
                    SELECT idMorceau, titre, nom AS groupe
                    FROM suitGroupe NATURAL JOIN groupe NATURAL JOIN joue NATURAL JOIN morceau
                    WHERE pseudo = %s AND dFin IS NULL
                ) AS t1
                EXCEPT
                (
                    SELECT idMorceau, titre, nom AS groupe
                    FROM morceau NATURAL JOIN joue NATURAL JOIN ecoute NATURAL JOIN groupe
                    WHERE idGroupe IN (
                        SELECT idGroupe
                        FROM suitGroupe
                        WHERE pseudo = %s AND dFin IS NULL
                    )
                    AND EXISTS (
                        SELECT e.idMorceau 
                        FROM ecoute e
                        WHERE e.pseudo = %s AND e.idMorceau = morceau.idMorceau
                    )
                    GROUP BY (idMorceau, titre, idGroupe, groupe)
                    ORDER BY sum(dureeEcoute) DESC LIMIT 2
                )
            ) AS t
            ORDER BY RANDOM() LIMIT 3;""", (pseudo, pseudo, pseudo))
            suggestion_2 = cur3.fetchall()
        with conn.cursor() as cur4:
            # selectionne le groupe le plus écouté par l'utilisateur
            cur4.execute("""SELECT idGroupe, nom
            FROM morceau NATURAL JOIN ecoute NATURAL JOIN joue NATURAL JOIN groupe
            WHERE pseudo = %s
            GROUP BY (idGroupe, nom)
            ORDER BY sum(dureeEcoute) DESC LIMIT 1;""", (pseudo,))
            groupe_prefere = cur4.fetchone()
            if groupe_prefere:
                with conn.cursor() as cur5:
                    # selectionne les groupes suivis par les utilisateurs qui suivent le groupe préfére, en enlevant celui-ci (redondant)
                    cur5.execute("""SELECT idGroupe, nom
                    FROM suitGroupe NATURAL JOIN groupe
                    WHERE pseudo IN (
                        SELECT pseudo
                        FROM suitGroupe
                        WHERE idGroupe = %s
                    )
                    EXCEPT
                    SELECT idGroupe, nom
                    FROM suitGroupe NATURAL JOIN groupe
                    WHERE idGroupe = %s;""", (groupe_prefere.idgroupe,groupe_prefere.idgroupe))
                    groupes = cur5.fetchall()
                    suggestion_3 = {
                        "groupe_prefere" : groupe_prefere.nom,
                        "groupes_suivis" : groupes
                    }
            else:
                suggestion_3 = {}
        with conn.cursor() as cur6:
            # sélectionne les groupes suivis par les utilisateurs qui écoutent les mêmes morceaux et les présente aléatoirement
            cur6.execute("""SELECT DISTINCT idgroupe, nom
            FROM suitgroupe NATURAL JOIN groupe
            WHERE pseudo IN (
                SELECT e2.pseudo
                FROM ecoute e1, ecoute e2
                WHERE e1.pseudo = %s AND e1.pseudo <> e2.pseudo AND e1.idMorceau = e2.idMorceau
            ) LIMIT 3;""", (pseudo,))
            suggestion_4 = cur6.fetchall()
        with conn.cursor() as cur7:
            # séléctionne les playlist des qui contiennent les morceaux écoutés par l'utilisateur et les présente aléatoirement
            cur7.execute("""SELECT * FROM (
                SELECT DISTINCT idplaylist, titre, pseudoCreateur, (
                    SELECT count(idmorceau)
                    FROM inclus
                    WHERE idplaylist = i.idplaylist
                ) as nbmorceaux
                FROM inclus i NATURAL JOIN playlist
                WHERE idmorceau IN (
                SELECT idmorceau
                FROM ecoute
                WHERE pseudo = %s
                )
            ) AS t
            ORDER BY RANDOM() LIMIT 3;""",(pseudo,))
            suggestion_5 = cur7.fetchall()
        with conn.cursor() as cur8:
            # sélectionne les playlist créees par les utilisateurs suivis et les présente aléatoirement
            cur8.execute("""SELECT * FROM (
                SELECT DISTINCT idplaylist, titre, pseudoCreateur, (
                    SELECT count(idmorceau)
                    FROM inclus
                    WHERE idplaylist = i.idplaylist
                ) as nbmorceaux
                FROM inclus i NATURAL JOIN playlist
                WHERE pseudocreateur IN (
                SELECT suivi
                FROM suitutilisateur
                WHERE suivant = %s
                )
            ) as t
            ORDER BY RANDOM() LIMIT 3;""",(pseudo,))
            suggestion_6 = cur8.fetchall()
    return render_template('utilisateur/suggestions.html', suggestion_1 = suggestion_1, suggestion_2 = suggestion_2, suggestion_3 = suggestion_3, suggestion_4 = suggestion_4, suggestion_5 = suggestion_5, suggestion_6 = suggestion_6)

@app.route('/recherche')
def recherche():
    q = request.args.get('q','')
    results = []
    return render_template('general/recherche.html', q=q, results=results)

if __name__ == '__main__':
    app.run(debug=True)
