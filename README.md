# File uploading script for KDE

This adds an entry into the context menu for files in KDE.

(I didn't actually know it would work throughout KDE, hence "Dolphin" being in the name :] )

## Installation

1. Download `install.sh` from the "Install" folder of this repo.
  
    You can either navigate to the file, click "Raw" and then save it

    OR

    `wget https://raw.githubusercontent.com/Chopper1337/srvrupload_dolphin/main/Install/install.sh`

1. Make it executable: `chmod +x install.sh`

1. Run it: `./install.sh`

1. Install `sshpass` through your distributions package manager and SSH into your server at least once

    Example for Ubuntu:

    `sudo apt install sshpass`

    `ssh username@server.com` -> say yes to the prompt -> enter your password

The install and uninstall scripts are very simple, I'll briefly outline what they do:

* Creates a folder named `srvrupload` in `~/.local/share/kservices5/`.

* Downloads the `srvrupload.desktop` and `srvrupload.sh` files from this repo to that location.

* Makes them executable.

Eventually I'll add this to the official KDE store thing so it's just a matter of clicking install and configuring it.

## Configuration

Go to `~/.local/share/kservices5/srvrupload/` and open `srvrupload.sh` in your preferred text editor.

`nano ~/.local/share/kservices5/srvrupload/srvrupload.sh`

Edit the variables such that they contain the info for your server (and domain if necessary)

I have briefly described the meaning of each variable in the comments above them.

## Info

Thanks to [Jamesjon](https://www.pling.com/u/jamesjon/) for his many many Dolphin Service Menus I could follow through to learn how to write this one. for his many many scripts I could follow through to learn how to write this one.

Thanks to [Nevalain](https://store.kde.org/u/nevalain) for making a similar script in 2005 (Probably for KDE 3.4) which gave me the idea.
