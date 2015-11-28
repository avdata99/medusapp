#files
echo "Compiling manual"
sphinx-build -b html docs/source manual

echo "Rsync files"
rsync -av --progress --exclude='.git' --rsh='ssh -p 987' \
	--exclude='simulacion' \
	--exclude='database.php' \
	--exclude='static/' \
	. pin2@medusapp.org:/home/pin2/www/
 
#permissions
echo "Fix file's and forlder's permissions"
ssh -p 987 pin2@medusapp.org "find /home/pin2/www/ -type d -exec chmod 755 {} \; && find /home/pin2/www/ -type f -exec chmod 644 {} \;"

# database 
echo "update database"
ssh -p 987 pin2@medusapp.org "mysql -u pin2_user -p pin2_db < /home/pin2/www/sql/updateDB.sql"
