"""
Flask Application Entry Point

This module initializes the Flask application, configures environment variables,
registers blueprints, and defines the main route. It follows PEP 8 standards and
professional documentation practices.
"""

from flask import Flask, render_template
from datetime import timedelta

import os

from optima.crud import crud_app
from optima.finder import finder_app
from optima.login import login_bp
from optima.mro import mro_bp

app = Flask(__name__, static_folder="static")
app.config["SECRET_KEY"] = os.getenv("SECRET_KEY")
if not app.config["SECRET_KEY"]:
    raise RuntimeError("SECRET_KEY environment variable not configured.")
app.config["PERMANENT_SESSION_LIFETIME"] = timedelta(minutes=10)

# Register Blueprints with URL prefixes
app.register_blueprint(crud_app, url_prefix="/crud")
app.register_blueprint(finder_app, url_prefix="/finder")
app.register_blueprint(login_bp, url_prefix="/login")
app.register_blueprint(mro_bp, url_prefix="/mro")


@app.route("/")
def index():
    """Render the main application page"""
    return render_template("index.html")


if __name__ == "__main__":
    app.run(debug=True)
