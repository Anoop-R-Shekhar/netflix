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
                sh "docker build -t netflix-web ."
            }
        }
    stage("Push to Docker Hub"){
            steps {
                echo "Pushing the image to docker hub"
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerhubPass",usernameVariable:"dockerhubUser")]){
                sh "docker tag netflix-web ${env.dockerhubUser}/netflix-web:latest"
                sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPass}"
                sh "docker push ${env.dockerhubUser}/netflix-web:latest"
                }
            }
        }
     stage("Deploy to Kubernetes"){
            steps {
                script{
                    dir('/var/lib/jenkins/workspace/netflix-project'){
                        withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'kubernetes', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') {
                        sh 'kubectl delete --all pods'
                        sh 'kubectl apply -f deploy.yaml'
                        sh 'kubectl apply -f netsvc.yaml'
                        }
                    }
                }
            }
        }
    }
}
