#########################################################
# 07 & 10 setup
#
# This script lives in /app/src/IDS/deploy.sh
#
#########################################################

#1 get deploymentfolder from command prompt

echo 'Please enter deployment folder: ' -n
read deploymentfolder
if [ ! -d $deploymentfolder ]; then
  echo "$deploymentfolder directory does not exist" && exit 1
fi

#2 copy public and app to app/src/IDS

echo "Copying $deploymentfolder/app/public to /app/src/IDS"
#cp -r $deploymentfolder/app/public /app/src/IDS
echo "Copying $deploymentfolder/auth to /app/src/IDS"
#cp -r $deploymentfolder/auth /app/src/IDS

#3 change directory

#cd /app/src/IDS
echo 'Changed directory to: '
echo pwd

#4 pm2

echo 'Stopping pm2'
#pm2 stop all
echo 'Deleting all'
#pm2 delete all
echo 'Starting ecosystem'
#pm2 start auth.ecosystem.json --env $env
echo 'Saving environment'
#pm2 save

echo 'Completed deployment'

exit 0
