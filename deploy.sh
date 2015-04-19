#files
rsync -av --progress --exclude='.git' --rsh='ssh -p 987' --exclude='simulacion' --exclude='database.php' . pin2@medusapp.org:/home/pin2/www/
 
#permissions
ssh -p 987 pin2@medusapp.org "find /home/pin2/www/ -type d -exec chmod 755 {} \;"
ssh -p 987 pin2@medusapp.org "find /home/pin2/www/ -type f -exec chmod 644 {} \;"

# database 
ssh -p 987 pin2@medusapp.org "mysql -u "
