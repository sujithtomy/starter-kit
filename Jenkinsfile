pipeline {
    agent { dockerfile true }

    stages {
        stage('Prepare'){
            steps {
                echo 'Pre Checking'
                sh 'printenv'
                sh 'node --version'
                sh 'npm --version'   
            }
        }

        stage('Build'){
            steps {
                echo 'Building'
                sh 'npm install'
                sh 'npm run build'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying'
            }
        }
    }

    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }
}