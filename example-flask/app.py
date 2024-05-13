from flask import Flask

VERSION = open("VERSION", "r").read().strip()

app = Flask(__name__)


@app.route("/")
def hello_world():
    return f"<p>Hello, World!</p><p>Version: {VERSION}</p>"
