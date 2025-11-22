from flask import Flask

app = Flask(__name__)

import routes.perros

@app.get("/")
def home():
    return {"message": "Servidor Flask funcionando"}


