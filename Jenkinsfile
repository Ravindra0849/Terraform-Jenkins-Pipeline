pipeline {
    agent any
    
    tools {
        terraform "terraform"
    }
    
    environment {
        AWS_ACCESS_KEY_ID = credentials("AWS_ACCESS_KEY_ID")
        AWS_SECRET_ACCESS_KEY = credentials("AWS_SECRET_ACCESS_KEY")
    }

    stages {
        stage('Clean WorkSpace') {
            steps {
                cleanWs()
            }
        }
        
        stage('Git Checkout') {
            steps {
                git 'https://github.com/Ravindra0849/Terraform-Jenkins-Pipeline.git'
            }
        }
        
        stage('Terraform Init') {
            steps{
                sh "terraform init"
			}
		}
		
		stage('Terraform Plan') {
            steps{
                sh "terraform plan > tfplan.txt"    // here iam storing the output in tfplan.txt file or we can go with mail id
			}
		}
		
		stage('Terraform Apply') {
            steps{
                script
                {
                   try
                   { 
                        input 'Waiting for Terraform Apply approval'
                        sh "terraform apply -auto-approve > tfapply.txt"
                    }
                    catch(Exception e5)
                    {
                        mail bcc: '', body: 'Please give approval for the Terraform Apply command', cc: '', from: '', replyTo: '', subject: 'Approval for  Terraform apply command', to: 'ravisree900@gmail.com'
                    }
                }
			}
		}
		
		stage('Terraform destroy') {
            steps{
                script
                {
                   try
                   { 
                        input 'Waiting for Terraform destroy approval'
                        sh "terraform destroy -auto-approve"
                    }
                    catch(Exception e5)
                    {
                        mail bcc: '', body: 'Please give approval for the destroying the resources command', cc: '', from: '', replyTo: '', subject: 'Approval for  Terraform destroy command', to: 'ravisree900@gmail.com'
                    }
                }
			}
		}
    }
}








