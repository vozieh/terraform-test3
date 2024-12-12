# Basic IAC CICD Deployment using Jenkins as automation server




##  Create a public EC2 server for installing Jenkins

a)	 tag Name:Jenkins
b)	 type ubuntu: t2.medium (4G RAM requirement) 
c)	 SG: open all traffic to 0.0.0.0/0
d)	 key pair: attached a keypair to enable SSH connectivity to instance. 
e)	Create and IAM Role with admin privileges and attached role to EC2 instance
f)	Adjust Iam role trust relationship to enable the role can be assumed by itself (necessary for the build server to use the role9
g)	Install AWS CLI on Server and and configure Server with passing credentials
h)	aws sts get-caller-identity  —> this should return the role 