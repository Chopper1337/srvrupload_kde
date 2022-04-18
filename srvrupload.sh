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

# The file path as passed through by KDE (The file you clicked "Upload to server" on)
local_path=$1

# The name of the file itself, without path
fileName=$(basename "$local_path")

# A string of random numbers to be prepended to the file name
randomString=$(shuf -i 100000000000-999999999999 -n 1)

# Copy the file to tmp folder
cp "$local_path" "/tmp/$fileName"

# Replace any spaces in the file name with an underscore
cleanFileName=${fileName// /_}

# Rename the file to the new name created above
mv "/tmp/$fileName" "/tmp/$randomString$cleanFileName"

# Reassign the local path variable to be the full new path of the file
local_path="/tmp/$randomString$cleanFileName"

# Upload the file to the server
sshpass -p $serverPassword scp -P $serverPort "$local_path" $serverUsername@$serverURL:"$remote_path"

# Generate a link to the file based on the variables specified at the start of this file.
link="$expectedURL$randomString$cleanFileName"

# Copy the link to xclip
echo $link | xclip

# Notify the user that the file has been uploaded and show the link
notify-send --app-name="Server Upload" --icon="cloud-upload" "Link copied to xclip $link" --expire-time=5000 > /dev/null 2>&1
