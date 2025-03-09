from flask import Flask, render_template, redirect

import sys

from optima.crud import crud_app
from optima.finder import finder_app

app = Flask(__name__, static_folder='static')


# Registra los Blueprints con los prefijos '/crud' y '/finder'
app.register_blueprint(crud_app, url_prefix='/crud')
app.register_blueprint(finder_app, url_prefix='/finder')



# Ruta principal
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/webside')
def hola():
    # Redirige al usuario a una URL externa
    return redirect("https://eltruji04.github.io/OPTIMA.github.io/")

if __name__ == '__main__':
    app.run(debug=True) 