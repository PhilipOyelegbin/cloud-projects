# cloud-docs

The repo is a documentation about cloud engineering and the steps in deploying a server.

## Linux commands

```
man

help

pushd

popd

tree

cd

pwd

mkdir

hostname -I

which
```

## Bash scripting and crontab

Create a .sh file and add the first line of code below

```
### Start the bash script with the code below

#!/usr/bin/bash
```

Check the path for script

```
echo $PATH
```

### Learn how to write bash script using the documentation below

https://devhints.io/bash
https://devdojo.com/bobbyiliev/the-only-bash-scripting-cheat-sheet-that-you-will-ever-need
https://learnxinyminutes.com/docs/bash/

Then set up cron job using the crontab command below

```
crontab -e	# to edit cron job
crontab -l	# to list all active cron jobs
crontab -r      # remove all cron jobs
```

## Setting up server via Ansible playbook

Install ansible using the command below

```
sudo apt install ansible
```

Create an Ansible folder in the root directory and go into the folder
Create a host-inventory and a playbook file.
Then run the command below to create an environment variable for Ansible

```
export ANSIBLE_INVENTORY=/root/ansible/host_inventory

echo $ANSIBLE_INVENTORY
```

Input your IP address into the host_inventory file and write your playbook script.
Then run the command to test the playbook

```
ansible all -m ping

ansible-playbook test.yml –check    # to check the result of the command on the designated server

ansible-playbook test.yml    # to execute the playbook on the designated server
```

## Services

IaaS: setting up infrastructure for a cloud hosting service.
STaas: for storage of files
PaaS: for deployment of codes
DaaS: for database management
FaaS: used by DevOps for microservice
SaaS: usage of softwares by end users

## Setting up a server generally

```
sudo apt install apache2

sudo mkdir -p /var/www/lansharks.com

sudo chown -R user:user /var/www/lansharks.com

sudo chmod -R 755 /var/www/lansharks.com
```

clone the website files into the /var/www/domain.com folder

```
sudo vim /etc/apache2/sites-available/lansharks.com.conf
```

```
<VirtualHost *:80>
	ServerAdmin	admin@lansharks.com
	ServerName	lansharks.com
	ServerAlias	www.lansharks.com
	DocumentRoot	/var/www/lansharks.com
	ErrorLog	${APACHE_LOG_DIR}/error.log
	CustomLog	${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

```
sudo a2dissite 000-default.conf

sudo a2ensite lansharks.com

sudo vim /etc/apache2/apache2.conf
```

```
ServerName www.lansharks.com
...
```

```
sudo systemctl restart apache2

sudo apache2ctl configtest

sudo vim /etc/hosts
```

```
...
127.0.0.1	www.lansharks.com
127.0.0.1	lansharks.com
```

### Enable the server for python

```
sudo a2enmod
```

Type cgid

```
sudo systemctl restart apache2
sudo vim /etc/apache2/conf-enabled/serve-cgi-bin.conf
```

```
…
	<IfDefine ENABLE_USER_LIB_CGI_BIN>
	ScriptAlias /cgi-bin/ /var/www/lansharks.com
	<Directory “/var/www/lansharks.com”>
		AllowOverride None
		Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
		AddHandlercgi-script .cgi .py
		Require all granted
	</Directory>
	</IfDefine>
```

```
sudo apachectl -t

sudo systemctl restart apache2

sudo chmod -R 775 /var/www/lansharks.com

sudo chown -R user:group/var/www/lansharks.com

sudo systemctl restart apache2
```

## Setting up node app on Linux server.

Install node and npm

```
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -

sudo apt install nodejs
```

cd into /var/www/html, create a folder where your node files will sit:

```
sudo mkdir node_project
```

Ensure to grant your user ownership over the folder so you can be able to make file edits:

```
sudo chown -R $USER:www-data node_project
sudo chmod -R 775 node_project
```

Create a blank index.js file, which will be the entry point of the application
Initialize and install the various dependencies needed for a Node project to run, i.e. the node_modules folder
Edit the index files as needed and run the code to know if the website is running.
The server should now running on the specified port in your code, once you go to http://(your-server-ip):4000 you should see the output. However, this is only good enough for development/staging. We do not want users having to access our application and having to type in port names, for SEO purposes and for the sake of branding. The solution is to make the Apache web server serve as reverse-proxy for the application so we would be able to type http://(your-server-ip) and still get to the node application.
Create a new virtual host file for our new app (Further reading: (Host several websites on a Linux server using Virtual Hosts)[https://dev.to/dreysongz/how-to-host-several-websites-on-a-single-linux-server-1l5b])

```
sudo nano /etc/apache2/sites-available/node-project.conf
```

Add the following code to the created host file and save (make use of the port number from your application)

```
<VirtualHost *:80>
    ServerName www.node-project.com
    DocumentRoot /var/www/html/node_project

    ProxyRequests Off
    ProxyPreserveHost On
    ProxyVia Full

    <Proxy *>
        Require all granted
    </Proxy>

    ProxyPass / http://localhost:4000/
    ProxyPassReverse / http://localhost:4000/
</VirtualHost>
```

Enable the config file and proxy module

```
sudo a2ensite node-project.conf

sudo a2enmod proxy proxy_http rewrite headers expires
```

Disable the default config file

```
sudo a2dissite 000-default
```

Restart apache

```
sudo service apache2 restart
```

### Follow other instructions to do an auto-start using the links below.

https://dev.to/dreywandowski/how-to-deploy-a-nodereact-app-on-a-linux-server-3pd9
https://gist.github.com/hasibdesk/a296fa59240f86421b78e79586adb264
https://javascript.plainenglish.io/deploy-nodejs-app-with-apache-on-ubuntu-22-04-518fa548132a

## Setting up Laravel app on Linux server.

https://www.linuxtuto.com/how-to-install-laravel-9-on-debian-11/

## Setting up WordPress website on Linux server

- Use the [wordpress ansible playbook](wp_playbook.yml) to install necessary tools on the server and follow the other instructions below;
  ssh into the server or access the server cli on the cloud
- Download the latest WordPress file using the code [sudo wget http://wordpress.org/latest.tar]
- Extract the files [tar xzf latest.tar]
- Move the files from the WordPress folder to the root folder [mv wordpress/* .]
- Change the files ownership [chown -R www.data: .]
- Setup the MySQL database for the WordPress website [CREATE DATABASE “wpdb”; CREATE USER “wpadmin"@”localhost";]
- Access the website using the server IP to install WordPress from the interface using the database parameters created earlier
- Get a domain from to assign a domain to the IP for easy access.
- Install let's encrypt SSL on the domain.

## Infrastructure as code

Infrastructure as Code is one way of raising the standard of infrastructure management and time to deployment. By using a combination of tools, languages, protocols, and processes, IaC can safely create and configure infrastructure elements in seconds.

## Benefits of Infrastructure as Code

An organization using IaC experiences these benefits:

- Speed: By avoiding manual intervention, infrastructure deployments are quick and safe.
- Source control: Code can be checked in source control for increased transparency and accountability.
- Documentation: The infrastructure code serves as living documentation of the actual state of the infrastructure.
- Consistency: Deploy identical infrastructure across the board, avoiding edge-cases and one-off configurations.
- Agility: DevOps has made software delivery more efficient and IaC brings agility to the realm of infrastructure management.
- Reusability: IaC makes it easy to create reusable modules; for example, to replicate development and production environments.

## How Infrastructure as Code Works

Infrastructure as Code can be explained from a high level in three simple steps and visualized with the diagram below.

- Developers write the infrastructure specification in a domain-specific language.
- The resulting files are sent to a master server, a management API, or a code repository.
- The platform takes all the necessary steps to create and configure the computer resources.

## Types of Infrastructure as Code

There are four main types of IaC that developers can choose from:

- Scripting: Writing scripts is the most direct approach to IaC. Ad-hoc scripts are best for executing simple, short, or one-off tasks. For complex setups, however, it’s best to use a more specialized alternative.
- Configuration management tools: Also known as configuration as code, these are specialized tools designed to manage software. They usually focus on installing and configuring servers. Examples of these tools are Chef, Puppet, and Ansible.
- Provisioning tools: Provisioning tools focus on creating infrastructure. Using these types of tools, developers can define exact infrastructure components. Examples of this are Terraform, AWS CloudFormation, and OpenStack Heat.
- Containers and templating tools: These tools generate templates or images pre-loaded with all the libraries and components required to run an application. Containerized workloads are easy to distribute and have much lower overhead than running a full-size server. Examples are Docker, rkt, Vagrant, and Packer.

The workload’s main elements are:

- Labels: used to organize resources in Terraform; they can be cross-referenced using selectors
- Container: defines a container workload and specifies which Docker image to use and how many computing resources to allocate to each container
- Target: the target specifies where to deploy the infrastructure; in the example, containers are deployed in Los Angeles, Atlanta, and New York PoPs.
