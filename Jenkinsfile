pipeline {
    environment {
    registry = "priya2802/gitfocus_service_kube"
    registryCredential = 'GITFocus-DockerHub'
    dockerImage = ''
  }
   agent {
       docker { 
                 image 'node'
                 args '-u root:root -p 3000:3000 --privileged -v docker_sock:/var/run/docker.sock'
       }
    }
    stages {
        stage('Restore') {
            steps {
                sh 'npm install'
                sh 'cp  index.d.ts ./node_modules/@types/chart.js'
            }
        }
        stage('Build') {
            steps {
                sh 'npm run-script build'
            }
        }
        stage('Clean Up'){
            steps {
                sh 'rm -r src output  e2e'
                sh 'rm -f browserslist tsconfig.app.json README.md package-lock.json  tsconfig.json angular.json  tsconfig.spec.json karma.conf.js  tslint.json index.d.ts package.json'
            }
        }
        stage('Building Image') {
            steps {
                nodejs('DAGNodeJS'){
                   sh 'node -v'
                   sh 'which node; which npm'
                   sh 'docker build --tag gitfocus:1.0 .'
                   sh 'ls -l'
                    /*script {
                               dockerImage = docker.build registry + ":$BUILD_NUMBER"
                               //dockerImage = docker.build registry + ":1.1"
                     }*/
                }
            }
        }      
        /*stage('Deploy') {
            steps {
               
                sh 'cp ./dist/* ../../GitAngular/'
            }
        } */          
    }
}
