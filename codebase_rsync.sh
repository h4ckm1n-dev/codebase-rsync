#!/bin/bash

# Constants
LOCAL_CODE_FOLDER="/path/to/your/local/code/folder"
WORK_CODE_FOLDER="username@work_computer_ip:/path/to/your/work/code/folder"

# Functions
usage() {
    echo "Usage: $0 [-push | -pull]"
    echo "  -push  Sync local code folder to the work computer"
    echo "  -pull  Sync work code folder to the local computer"
    exit 1
}

sync_push() {
    rsync -avz --delete "$LOCAL_CODE_FOLDER" "$WORK_CODE_FOLDER" && \
    echo "Code pushed to work computer successfully."
}

sync_pull() {
    rsync -avz --delete "$WORK_CODE_FOLDER" "$LOCAL_CODE_FOLDER" && \
    echo "Code pulled from work computer successfully."
}

check_dependencies() {
    if ! command -v rsync &> /dev/null; then
        echo "rsync could not be found, please install rsync to use this script."
        exit 1
    fi
}

# Main script
check_dependencies

if [ "$#" -ne 1 ]; then
    read -rp "No action specified. Do you want to push or pull? " ACTION
else
    ACTION=$1
fi

case $ACTION in
    -push|push)
        sync_push
        ;;
    -pull|pull)
        sync_pull
        ;;
    -h|--help)
        usage
        ;;
    *)
        echo "Invalid action: $ACTION"
        usage
        ;;
esac
