#!/bin/bash

# Your Nikke Steam AppID
APP_ID=16270348604281978880
ATTEMPT=1

while true; do
    echo "------------------------------------------"
    echo "ATTEMPT #$ATTEMPT"
    echo "Cleaning up previous processes..."
    
    # Nuke the launcher and game processes
    pkill -9 -f "NIKKE"

    echo "Launching game via Steam..."
    steam steam://rungameid/$APP_ID &
    
    # Wait for the launcher to fork the extra processes
    # If 10s is too long or short for your PC, change it here
    sleep 10
    
    # COUNT THE PROCESSES
    # Based on your find: Failed = 6, Success = 12
    P_COUNT=$(pgrep -f "NIKKE" | wc -l)
    
    if [ "$P_COUNT" -gt 9 ]; then
        echo "SUCCESS! Process count hit $P_COUNT."
        echo "It took $ATTEMPT attempts to win the lottery."
        break
    else
        echo "STALLED: Only $P_COUNT processes found."
        echo "Nuking and retrying..."
        ((ATTEMPT++))
    fi
done
