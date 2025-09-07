## 🔧 **Web Hosting Server Setup**

**Role**: Cloud Engineer
**Task**: Set up a **web hosting server** with a **cPanel-like control panel**, enabling **multiple users** to host and manage **different websites** independently.

## 📸 Deliverables

1. I set up a virtual private server on AWS using ubuntu 24 operating system and ssh into the server, below is the snapshot of my static private IP using the command `ip a`.
   ![static private ip](./assets/staticprivip.png)

2. Installed hestiacp on the server based on my personal specification using the guide in the link (https://hestiacp.com/install). Below are the snapshot of the installation.
   ![Installation](./assets/installation.png)
   ![Completed installation](./assets/installationcomp.png)

3. I was able to access the control panel login page via the broswer using the subdomain created as shown below.
   ![Cpanel login](./assets/cplogin.png)

4. I was able to login as an admin via the web browser
   ![Cpanel dashboard](./assets/cpdash.png)

5. I created a new user account as an admin
   ![User account](./assets/cpusers.png)

6. I logedin as a user, added a domain on the user account and setup a wordpress website using the quick install button.
   ![hosted domain](./assets/userdomain.png)
   ![installed wordpress](./assets/userwpsetup.png)
   ![website](./assets/userwebsite.png)

7. I was able to access the website via SSL.
   ![website](./assets/usersecureweb.png)

8. The domain dns can also be menagd from the cpanel as shown below
   ![domain dns](./assets/domaindns.png)

9. The firewall rule for the server can be checked by the super admin via the admin panel as shown below.
   ![firewall](./assets/cpfirewall.png)

10. Resources usage, error logs, awstat can be accessed as shown below, also it can be filtered based on user if loggedin as an admin.
    ![resources usage](./assets/domainresources.png)
    ![logs](./assets/domainlogs.png)
    ![awstats](./assets/domainawstat.png)
