pipeline {
    agent any
    stages {
        stage('Configure Environment') {
            steps {
                ansiblePlaybook become: true, credentialsId: 'key-1', disableHostKeyChecking: true, installation: 'ansible-plugin', inventory: './ansible/local-and-host-inv.yaml', playbook: './ansible/config-playbook.yaml'
            }
        }
        stage('Build') {
            steps {
                ansiblePlaybook credentialsId: 'key-1', disableHostKeyChecking: true, installation: 'ansible-plugin', inventory: './ansible/host-inv.yaml', playbook: './ansible/build-playbook.yaml', extras: '-e tag=${BUILD_NUMBER}'
            }
        }
        stage('Deploy') {
            steps {
                ansiblePlaybook credentialsId: 'key-1', disableHostKeyChecking: true, installation: 'ansible-plugin', inventory: './ansible/host-inv.yaml', playbook: './ansible/deploy-playbook.yaml', extras: '-e tag=${BUILD_NUMBER}'
            }
        }
    }
}