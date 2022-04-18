#!/bin/sh

#### EDIT THESE VARIABLES ####
# The URL or IP of your server
serverURL="yourserver.com"

# The username and password of the remote user you'll be using SFTP with
serverUsername="user"
serverPassword="strongandcomplicatedpassword"

# The port expected by the server for sftp
serverPort=22

# Remote path to upload the file to
remote_path=/var/www/public/

# The URL (excluding file name) you expect the file to have to be accessible
expectedURL="https://yourserver.com/public/"

# Path to the file to be uploaded
local_path=$1

# Name of the file to be uploaded
fileName=$(basename $local_path)

# Generates a random number to be prepended to the file name
randomString=$(shuf -i 100000000000-999999999999 -n 1)

cp $local_path /tmp/$fileName
mv /tmp/$fileName /tmp/$randomString$fileName
local_path=/tmp/$randomString$fileName

# Uploading the file
sshpass -p $serverPassword scp -P $serverPort $local_path $serverUsername@$serverURL:$remote_path
link=$expectedURL$randomString$fileName
echo $link | xclip
notify-send --app-name="Server Upload" --icon="cloud-upload" "Link copied to xclip $link" --expire-time=5000 > /dev/null 2>&1
