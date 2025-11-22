pipeline {
    agent any // 1️⃣ Jenkins puede usar cualquier nodo disponible

    stages {
        stage('checkout') { // 2️⃣ Clonar el repositorio desde GitHub
            steps {
                git branch: 'main', url: 'https://github.com/EuDoR/mamiluPet.git'
            }
        }
        stage('build_docker_image') { // 3️⃣ Construir la imagen Docker
            steps {
                sh 'docker build -t mamilupet:1.0 .'
            }
        }
        stage('run_container') { // 4️⃣ Probar que la imagen funciona
            steps {
                sh 'docker run -d -p 5000:5000 --name test_mamilupet mamilupet:1.0'
                sh 'sleep 5'  // darle tiempo a que arranque
                sh 'curl http://localhost:5000/perros'  // verificar endpoint
                sh 'docker stop test_mamilupet && docker rm test_mamilupet'
            }
        }
    }
}