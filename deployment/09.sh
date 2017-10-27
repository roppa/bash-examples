#########################################################
# 09 setup
#
# This script lives in /app/src/IDS/deploy.sh
#
#########################################################

#########################################################
# Variables
#########################################################

username=$(whoami)

#change below to be generated?
deploymentfolder=''

#The gzip file contents are:
# /search
# /view_generation
# /auth
# /app (front end app)

searchLocation="/app/src/IDS/search"
viewGenerationLocation="/app/src/IDS/search/view_generation"
authLocation="/auth"
appLocation="/app"

#1 Get the deployment folder

echo 'Enter the deployment folder'
read deploymentfolder
if [ ! -d $deploymentfolder ]; then
  echo "$deploymentfolder directory does not exist" && exit 1
fi

#2 Get the .tar.gz path from terminal

echo 'Enter the path of the .tar.gz'
read archiveFile
if [ ! -f $archiveFile ]; then
  echo "$archiveFile .tar.gz file does not exist" && exit 1
fi

#3 prompt user for environment [dev, prod, staging]

env=''

PS3='Select environment: '
options=("dev" "staging" "production" "exit")
select opt in "${options[@]}"
do
    case $opt in
        "dev")
            env='dev'
            break
            ;;
        "staging")
            env='staging'
            break
            ;;
        "production")
            env='production'
            break
            ;;
        "exit")
            exit
            ;;
        *)
            echo invalid option
            ;;
    esac
done

echo "Environment is $env"

#########################################################
# Tarball
#########################################################
#4 Extract the tar file and mv contents to current folder

echo "Extracting $archiveFile to $deploymentfolder"
#tar czf $archiveFile

#########################################################
# Copy files
#########################################################
#5 copy search from ./trunk/application/node/search to /app/src/IDS/

echo "copying $deploymentfolder/search to /app/src/IDS"
#cp -r $deploymentfolder/search /app/src/IDS

#6 copy view_generation app from ./trunk/application/node/view_generation to /app/src/IDS/

echo "copying $deploymentfolder/view_generation to /app/src/IDS"
#cp -r $deploymentfolder/view_generation /app/src/IDS

#########################################################
# PM2
#########################################################

echo 'Stopping pm2'
#pm2 stop all
echo 'Deleting all'
#pm2 delete all
echo 'Starting ecosystem'
#pm2 start asynchronousEvents.ecosystem.json --env $env
echo 'Saving environment'
#pm2 save

#########################################################
# SCP
#########################################################
#6 SCP search to 12
echo 'Running SCP as background tasks'

echo "SCP $searchLocation $username@dassvr12:~/$deploymentfolder"
#scp -r $searchLocation $username@dassvr12:~/$deploymentfolder &
echo "SCP $viewGenerationLocation $username@dassvr12:~/$deploymentfolder"
#scp -r $viewGenerationLocation $username@dassvr12:~/$deploymentfolder &

#7 SCP auth app 07
echo "SCP $authLocation $username@dassvr07:~/$deploymentfolder"
#scp -r $authLocation $username@dassvr07:~/$deploymentfolder &
echo "SCP $appLocation $username@dassvr07:~/$deploymentfolder"
#scp -r $appLocation $username@dassvr07:~/$deploymentfolder &

#7 SCP auth app 10
echo "SCP $authLocation $username@dassvr10:~/$deploymentfolder"
#scp -r $authLocation $username@dassvr10:~/$deploymentfolder &
echo "SCP $appLocation $username@dassvr10:~/$deploymentfolder"
#scp -r $appLocation $username@dassvr10:~/$deploymentfolder &

echo 'Completed deployment'

exit 0
