#dentro de la carpeta
source venv/bin/activate
#para salir basta con
deactivate
#para instalar flask
pip install flask
#luego de codear para levantar y probar basta con, el segundo es solo para mi caso de verlo en mi pc
flask --app app run
flask run --host=0.0.0.0 --port=5000
