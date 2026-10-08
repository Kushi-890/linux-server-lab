 Linux Server Lab

A hands-on project: an Ubuntu Server VM running Nginx, with SSH key login,
a firewall, automated backups, and two troubleshooting scenarios.

Environment
 VirtualBox VM, Ubuntu Server 26.04 LTS, 2 GB RAM, 20 GB disk
 Bridged network, accessed over SSH from Windows

 What I built
1. Nginx web server: installed and managed with systemctl
2. SSH key login: generated an ed25519 key, so password login is no longer needed
3. Firewall (UFW): allowed ports 22 and 80 only
4. Backup script: backup.sh compresses /var/www/html, keeps the 7 newest backups, and runs daily at 2 AM through cron

Troubleshooting scenarios

 1. Broken Nginx config
Symptom: Nginx failed to restart and the site was down
Diagnosis: `sudo nginx -t` named the bad file and line number
Fix: removed the bad config, ran `nginx -t`, then restarted Nginx
Lesson:always run `nginx -t` before restarting

 2. Blocked port 80
Symptom: the page timed out from Windows
Diagnosis: Nginx was running and `curl localhost` returned 200 OK, but `ufw status` showed port 80 missing
Fix:`sudo ufw allow 80`
Lesson: a service can be healthy while the firewall blocks it

