#!/bin/sh

#### EDIT THESE VARIABLES ####
# The URL or IP of your server
serverURL="yourserver.com"
# The username and password of the remote user you'll be using SFTP with
serverUsername="user"
serverPassword="strongandcomplicatedpassword"
# The port expected by the server
serverPort=22
# Remote path to upload the file to
remote_path=/var/www/public/
# The URL (excluding file name) you expect the file to have to be accessible
expectedURL="https://yourserver.com/public/"

local_path=$1
sshpass -p $serverPassword scp -P $serverPort $local_path $serverUsername@$serverURL:$remote_path
fileName=$(basename $local_path)
link=$expectedURL$fileName
echo $link | xclip
notify-send --app-name="Server Upload" --icon="cloud-upload" "Link copied to xclip $link" --expire-time=5000 > /dev/null 2>&1