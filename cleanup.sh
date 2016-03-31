#cleanup
#root needed
#ver 0.1

cd /var/log
cat /dev/null > messages
cat /dev/null > wtmp
echo "Log-files are cleaned"
