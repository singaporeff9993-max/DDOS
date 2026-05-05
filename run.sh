#!/usr/bin/env bash

set -e

REPO_NAME=$(basename "$PWD")
echo "Running project: $REPO_NAME 🚀"

# Stop cleanly on Ctrl+C
trap "echo 'Stopped by user'; exit" SIGINT

# Check Python
if ! command -v python3 &> /dev/null
then
    echo "Python3 not found. Installing..."
    sudo apt update && sudo apt install -y python3
fi

# Auto-restart loop
while true
do
    echo "Starting m.py..."
    
    python3 m.py

    EXIT_CODE=$?
    echo "Script exited with code $EXIT_CODE"

    echo "Restarting in 1 second..."
    sleep 1
done
