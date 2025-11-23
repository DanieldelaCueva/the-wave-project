from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def accueil():
    # exemples de données de démo
    top_tracks = []
    top_groups = []
    last_albums = []
    return render_template('accueil.html', top_tracks=top_tracks, top_groups=top_groups, last_albums=last_albums)

@app.route('/connexion', methods=['GET','POST'])
def connexion():
    if request.method == 'POST':
        # authentification placeholder
        return 'Connexion (placeholder)'
    return render_template('connexion.html')

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
