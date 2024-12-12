# Basic IAC CI-CD Deployment using Jenkins as automation server



##  1 Create a public EC2 server for installing Jenkins

a)	 **`tag`**  Name:Jenkins

b)	 **`type/size`**  ubuntu: t2.medium (4G RAM requirement) 

c)	 **`SG`** : open all traffic to 0.0.0.0/0

d)	 +**`key pair`** : attached a keypair to enable SSH connectivity to instance. 

e)	Create and IAM Role with **`admin privileges`** and attached role to EC2 instance

f)	Adjust Iam role trust relationship to enable the role can be assumed by itself **(necessary for the build server to use the role)**
   
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Principal": {
                     "Service": "ec2.amazonaws.com"
                    },
                     "Action": "sts:AssumeRole"
                },
                {
                    "Effect": "Allow",
                     "Principal": {
                     "AWS": "arn:aws:iam::665645643210:role/admin"
                    },
                     "Action": "sts:AssumeRole"
        }
    ]
    }


g)	Install **[AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)** on Server and and configure Server without credentials **(no Access and Secret Keys)**
    sudo snap install aws-cli --classic

h)	**`Test`** : 
    aws sts get-caller-identity  —> this should return the role 




## 2 [Install Jenkins](https://www.jenkins.io/doc/book/installing/linux/#debianubuntu) with below commands. 

Downloads the GPG key required to verify the authenticity of Jenkins packages and saves it in the /usr/share/keyrings/ directory.

     sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

Add the Jenkins repository to your system's APT sources list and ensures that the repository is signed using the GPG key you downloaded

    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]"  https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null


Update and Install Jenkins 

    sudo apt-get update
    sudo apt-get install jenkins





## 3 Install JAVA (a prerequisite for Jenkins)

        sudo apt update

Add required dependencies for the jenkins package

    sudo apt install fontconfig openjdk-17-jre -y

Verify Java Installation 

    java -version 




## 4  Start Jenkins and Access Jenkins UI

You can enable the Jenkins service to start at boot with the command:

    sudo systemctl enable jenkins

Start the Jenkins service

    sudo systemctl start jenkins


Check the status of the Jenkins service

    sudo systemctl status jenkins



## 5 	Access UI
	
a.	 On browser, paste http://`<public-IP-jenkins-server>`:8080

b.	Follow Onscreen Instructions to configure Jenkins 

c.	Build A Pipeline 

d.	Configure Pipeline Deploy Code From a Github Repository. 
	In the space, paste the scripted pipeline provided. 




## 6 [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) on Server 

Ensure that your system is up to date and you have installed the gnupg, software-properties-common, and curl packages installed. You will use these packages to verify HashiCorp's GPG signature and install HashiCorp's Debian package repository.

    sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

Install the HashiCorp GPG key.

    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null


Add the official HashiCorp repository to your system. 

    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list


Update packages and Install terraform 

    sudo apt update
    sudo apt-get install terraform

Verify Terraform has been Installed 

    terraform -help
