# Basic IAC CICD Deployment using Jenkins as automation server




##  1 Create a public EC2 server for installing Jenkins

a)	 tag Name:Jenkins

b)	 type ubuntu: t2.medium (4G RAM requirement) 

c)	 SG: open all traffic to 0.0.0.0/0

d)	 key pair: attached a keypair to enable SSH connectivity to instance. 

e)	Create and IAM Role with admin privileges and attached role to EC2 instance

f)	Adjust Iam role trust relationship to enable the role can be assumed by itself (necessary for the build server to use the role9

g)	Install AWS CLI on Server and and configure Server with passing credentials

h)	aws sts get-caller-identity  —> this should return the role 




## 2 [Install Jenkins](https://www.jenkins.io/doc/book/installing/linux/#debianubuntu) with below commands. 

Downloads the GPG key required to verify the authenticity of Jenkins packages and saves it in the /usr/share/keyrings/ directory.

     sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

Add the Jenkins repository to your system's APT sources list and ensures that the repository is signed using the GPG key you downloaded

    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]"  https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null


Update and Install Jenkins 

    sudo apt-get update
    sudo apt-get install jenkins
