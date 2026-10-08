kushi80@linux-lab:~$ cat ~/scripts/backup.sh
#!/bin/bash
# Backs up the Nginx web folder with a timestamp
SRC="/var/www/html"
DEST="$HOME/backups"
STAMP=$(date +%Y-%m-%d_%H-%M-%S)
tar -czf "$DEST/web-backup-$STAMP.tar.gz" "$SRC" 2>/dev/null
echo "$(date): backup created web-backup-$STAMP.tar.gz" >> "$DEST/backup.log"
# Keep only the 7 newest backups
ls -t "$DEST"/web-backup-*.tar.gz | tail -n +8 | xargs -r rm
