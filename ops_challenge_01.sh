#!/bin/bash
#
# Author: Jamie Giannini

# Objectives:
# [X] Copy /var/log/syslog to the current working directory
# [X] Appends the current date and time to the filename
# Extra:
# [X] Include in your bash script some timestamped echo statements telling the user what is happening at each stage of the script.

TIMESTAMP="$(date +"%B_%d_%Y_%R")" # Formats date as full month name, day of month, year, time (24 hour) 

#######################################
# Copy syslog to current working directory and append current date and time to filename
# Globals:
#   TIMESTAMP
# Arguments:
#   None
#######################################
function copy_log_current_dir () {
# rsync synchronizes files and directories between two locations and copies files to local and remote locations.
# -a recursively copies directories, transfers special and block devices and preserves symbolic links, modification times, group, ownership, and permissions.
# -P outputs progress
# trailing / on the source directory copies just the source directory’s contents to the destination
# . tells it to use the current working directory as the destination
    orig_file="/var/log/syslog"
    #copy_file="/var/log/syslog_${TIMESTAMP}"
    echo ""
    echo "######################################################"
    echo -e "\nCopying $orig_file to current active directory and appending date and time to file..." #Feedback on what is happening
    echo -e "\n######################################################"
    destination="syslog_${TIMESTAMP}" # Set file destination and name
    active_dir=$(pwd)
    echo -e "\nCurrent active directory is: ${active_dir}"
    echo -e "\n######################################################"
    echo -e "\nNew file name is: ${destination}"
    echo -e "\n######################################################"
    command cp -r /var/log/syslog "${destination}" # copy recursively /var/log/syslog to current active directory located in destination variable

    # This script works well enough as is using cp, but I wanted to try using rsync. I could not get rsync to accept time parameter, I get the following error: rsync error: unexplained error (code 255) at io.c(228) [sender=3.2.3]
    #command rsync -a -P /var/log/syslog "${destination}" # Uses rsync to copy /var/log/syslog to current active directory located in destination variable
    getTime="$(date +"%r")"
    echo -e "\nCopy complete at ${getTime}" # Lets user know the task is complete and gives time complete in 12 hour format
    echo -e "\n"
}

copy_log_current_dir # calls function




