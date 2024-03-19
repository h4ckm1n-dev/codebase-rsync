#!/bin/bash

# Define the source and destination paths for both operations
LOCAL_CODE_FOLDER="/path/to/your/local/code/folder"
WORK_CODE_FOLDER="username@work_computer_ip:/path/to/your/work/code/folder"

ACTION=""

# Check for command line argument
if [ "$#" -ne 1 ]; then
    echo "No action specified."
    read -p "Do you want to push or pull? " ACTION
else
    ACTION=$1
fi

# Validate and perform the action
case $ACTION in
    -push|push)
        rsync -avz --delete "$LOCAL_CODE_FOLDER" "$WORK_CODE_FOLDER"
        echo "Code pushed to work computer successfully."
        ;;
    -pull|pull)
        rsync -avz --delete "$WORK_CODE_FOLDER" "$LOCAL_CODE_FOLDER"
        echo "Code pulled from work computer successfully."
        ;;
    *)
        echo "Invalid action: $ACTION"
        echo "Usage: $0 -push | -pull"
        exit 2
        ;;
esac
