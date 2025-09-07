# 🔧 **Task Assignment: Web Hosting Server Setup**

**Role**: Cloud Engineer

**Task**: Set up a **web hosting server** with a **cPanel-like control panel**, enabling **multiple users** to host and manage **different websites** independently.

---

## ✅ **Requirements**

1. **Cloud Environment**

   - Set up on a cloud server with any cloud provider.
   - Operating System: Debian 12, Ubuntu 22.04, or CentOS/AlmaLinux 8+.

2. **Web Hosting Stack**

   - Web Server: Apache or Nginx
   - PHP, MySQL/MariaDB
   - FTP (vsftpd or ProFTPD)
   - Mail Server (optional, but recommended)
   - DNS server setup (Bind9 or integrated panel DNS)

3. **Control Panel**

   - Use a free and open-source cPanel alternative such as:

     - **HestiaCP**
     - **CyberPanel**
     - **ISPConfig**
     - (Optional: Install cPanel/WHM if licensing is available)

4. **Multi-user Hosting Support**

   - Each user must have:

     - Independent control panel access
     - Ability to add/manage domains, emails, databases, etc.

5. **Security & Access**

   - UFW or iptables firewall configured
   - SSL enabled (via Let's Encrypt or custom certs)
   - SSH access restricted
   - Fail2Ban installed (optional)

6. **Accessibility**

   - Make the panel accessible via a domain name with proper firewall/NAT configuration.

---

## 📸 **Submission Deliverables (Snapshots)**

The Cloud Engineer should submit the following **snapshots (screenshots)** or evidence upon task completion:

| #   | Snapshot / Evidence              | Description                                                                |
| --- | -------------------------------- | -------------------------------------------------------------------------- |
| 1   | **Server IP Configuration**      | `ip a` showing static private IP setup                                     |
| 2   | **Panel Installation Logs**      | Screenshot of successful installation output (HestiaCP, CyberPanel, etc.)  |
| 3   | **Panel Login Page**             | Browser screenshot of control panel login page via local/public IP         |
| 4   | **Admin Dashboard**              | Control panel dashboard showing admin user interface                       |
| 5   | **New User Creation**            | Panel interface showing multiple user accounts created                     |
| 6   | **Website Hosting**              | Domain or subdomain hosted for one of the users (with basic HTML/PHP page) |
| 7   | **SSL Enabled Site**             | Access to website over HTTPS (Let’s Encrypt certificate or custom cert)    |
| 8   | **DNS Configuration (optional)** | DNS records managed via the panel for hosted domain                        |
| 9   | **Firewall Rules**               | UFW or iptables rules (`sudo ufw status` or `iptables -L`)                 |
| 10  | **Resource Usage**               | Screenshot from panel or `htop`/`top` showing server resource usage        |

---

## 📁 **Optional Extra Deliverables**

- **System documentation**: A short PDF or markdown file describing:

  - Server specs and OS
  - Panel installed and version
  - How to add users/websites
  - Backup strategy (if configured)
  - Admin login credentials (shared securely)

- **Backup & Restore Demonstration** (screenshot or short video showing this from panel)

---
