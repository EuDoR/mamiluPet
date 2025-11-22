from app import app

@app.get("/perros")
def listar_perros():
    return [
        {"nombre": "Fido", "raza": "Labrador"},
        {"nombre": "Luna", "raza": "Beagle"},
        {"nombre": "Max", "raza": "Pastor Alemán"}
    ]