pipeline {

    agent any

    stages {

        stage('Run Karate Tests') {
            steps {
                bat 'mvn clean test -Dtest=TestRunner'
            }
        }

    }

    post {
        always {
            publishHTML([
                allowMissing: true,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: 'target/karate-reports',
                reportFiles: 'karate-summary.html',
                reportName: 'Karate Test Report'
            ])
        }
    }
}