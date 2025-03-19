pipeline {
    agent any 
    stages{
        stage("Clone Code"){
            steps {
                echo "Cloning the code"
                git url:"https://github.com/Anoop-R-Shekhar/netflix.git", branch: "master"
            }
        }
    stage("Build"){
            steps {
                echo "Building the image"
                sh "docker build -t Netflix-web ."
            }
        }
    }
}
