# simple-node-js-react-npm-app

* Installed Jenkins in local machine and edited /etc/default/jenkins file and added port 3000 so that jenkins is available at this Port
* Edited the jenkins file to build the react app. Alos changed package.json start commoand to start the website ate Port 3004.
* Now to build other images edited jenkinsfile. Instead of local repository I have used personal docker hub
* Added all manifest file in Directory 'Deployment'
* Created Kubernets cluster secrets from MongoDB and Postgres
* The deploymemnt scripts gets the secret input from User, then creats the secret in cluster and finally deploy all the components in cluster. The script is also in Deployment directory

