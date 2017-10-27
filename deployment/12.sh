#########################################################
# 12 setup
#
# This script lives in /app/src/IDS/deploy.sh
#
#########################################################

#1 get deploymentfolder from command prompt

echo 'Please enter deployment folder path' -n
read deploymentfolder
if [ ! -d $deploymentfolder ]; then
  echo "$deploymentfolder directory does not exist" && exit 1
fi

#2 copy search and view_generation to app/src/IDS

echo "Copying $deploymentfolder/search to /app/src/IDS"
#cp -r $deploymentfolder/search /app/src/IDS
echo "Copying $deploymentfolder/view_generation to /app/src/IDS"
#cp -r $deploymentfolder/view_generation /app/src/IDS

#3 pm2

#cd /app/src/IDS
echo 'Changed directory to: '
echo pwd

echo 'Stopping pm2'
#pm2 stop all
echo 'Deleting all'
#pm2 delete all
echo 'Starting ecosystem'
#pm2 start asynchronousEvents.ecosystem.json --env $env
echo 'Saving environment'
#pm2 save

echo 'Completed deployment'

exit 0
