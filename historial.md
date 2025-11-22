#dentro de la carpeta
source venv/bin/activate
#para salir basta con
deactivate
#para instalar flask
pip install flask
#luego de codear para levantar y probar basta con, el segundo es solo para mi caso de verlo en mi pc
flask --app app run
flask run --host=0.0.0.0 --port=5000
#luego se configura y se constrye imagenes con docker para pruebas
 docker build -t mamilupet:1.0 .
 docker run -p 5000:5000 mamilupet:1.0
#se configura jenkins
<!-- Configurar el pipeline
En la página de configuración del pipeline, ve al apartado Pipeline.
Selecciona Pipeline script from SCM (script desde el control de versiones).
Configura:
SCM: Git
Repository URL: https://github.com/EuDoR/mamiluPet.git
Branch: main
Script Path: Jenkinsfile (si está en la raíz del repo)
Esto le dice a Jenkins que use tu Jenkinsfile desde GitHub. -->
#problemas al ejecutar docker desde jenkins
sudo usermod -aG docker jenkins
