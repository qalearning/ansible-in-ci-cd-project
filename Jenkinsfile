pipeline {
    agent any
    stages {
        stage('Set Up Environment') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'aws-credentials', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable:  'AWS_ACCESS_KEY_ID')]) {
                    sh "terraform -chdir=Terraform/ init"
                    sh "terraform -chdir=Terraform/ plan"
                    sh "terraform -chdir=Terraform/ apply -auto-approve"
                    sh "sleep 30"
                }
            }
        }
        stage('Configure Environment') {
            steps {
                sh "terraform -chdir=Terraform/ output -raw aws-instance-ip > ip_address"
                sh "sed -i 's/{{ host-1 }}/${readFile 'ip_address'}/g' ./ansible/host-inv.yaml"
                sh "cat ./ansible/host-inv.yaml"
                ansiblePlaybook become: true, credentialsId: 'key-1', disableHostKeyChecking: true, installation: 'ansible-plugin', inventory: './ansible/host-inv.yaml', playbook: './ansible/config-playbook.yaml'
                ansiblePlaybook become: true, credentialsId: 'key-1', disableHostKeyChecking: true, installation: 'ansible-plugin', inventory: './ansible/host-inv.yaml', playbook: './ansible/build-playbook.yaml', extras: '-e tag=${BUILD_NUMBER}'
            }
        }
        stage('Deploy') {
            steps {
                ansiblePlaybook credentialsId: 'key-1', disableHostKeyChecking: true, installation: 'ansible-plugin', inventory: './ansible/host-inv.yaml', playbook: './ansible/deploy-playbook.yaml', extras: '-e tag=${BUILD_NUMBER}'
            }
        }
    }
}
