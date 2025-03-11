pipeline {
    agent any
    options {
        ansiColor('xterm')  // Ativa a interpretação de cores ANSI
    }

    environment {
        NODE_OPTIONS = "--max_old_space_size=4096"  // Ajuste para evitar problemas de memória no Node.js
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/DiogoCavalcanti/cyPipe.git'
            }
        }

        stage('Set Registry') {
            steps {
                sh "npm config set registry http://portal.pje.redejt/nexus/repository/npm-group/:_auth=ZGlvZ28uY2F2YWxjYW50aUB0c3QuanVzLmJyOkxlbW15U3RlcjY2QA=="
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    if (fileExists('package.json')) {
                        sh 'export TERM=xterm && npm install'
                    } else {
                        error "Arquivo package.json não encontrado!"
                    }
                }
            }
        }

        stage('Run Cypress Tests') {
            steps {
                ansiColor('xterm') {  // Ativa ANSI especificamente para esse bloco
                    sh 'npx cypress run'
                }
            }
        }

        stage('Archive Test Reports') {
            steps {
                publishHTML(target: [
                    allowMissing: false,
                    alwaysLinkToLastBuild: true,
                    keepAll: true,
                    reportDir: 'cypress/reports/html',
                    reportFiles: 'index.html',
                    reportName: 'Cypress Test Report'
                ])
            }
        }
    }

    post {
        success {
            echo "Pipeline executado com sucesso!"
        }
        failure {
            echo "Ocorreu um erro na execução do pipeline!"
        }
    }
}