#!/bin/bash

# Tomato Timer Script (25 minutes focus, 5 minute break by default)

# Usage: ./tomato.sh [FOCUS_TIME_MINUTES] [BREAK_TIME_MINUTES]

# Set default focus and break times (can be overridden by arguments)
focus_time=${1:-25}
break_time=$(( focus_time / 5 ))
break_time=${2:-${break_time:-5}}

# Convert minutes to seconds
focus_seconds=$(( focus_time * 60 ))
break_seconds=$(( break_time * 60 ))

# Check operating system and use appropriate notification method
os_name=$(uname)
if [[ "$os_name" == "Darwin" ]]; then
  # macOS
  while true; do
    clear  # Clear the screen before displaying the countdown

    # Focus period
    echo "**  Focus Time (Remaining: $(date -u -j -f %s $focus_seconds +%M:%S)) **"
    focus_end=$(( $(date +%s) + focus_seconds ))
    while [[ "$focus_end" -ge $(date +%s) ]]; do
      remaining_time=$(( focus_end - $(date +%s) ))
      echo -ne "\r\e[K$(date -u -j -f %s $remaining_time +%M:%S)"  # Clear line and display remaining time
      sleep 1
    done

    # Break notification
    osascript -e 'display notification "Time to walk and rest!" with title "Break"'
    read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'

    # Break period
    echo "** ☕️ Break Time (Remaining: $(date -u -j -f %s $break_seconds +%M:%S)) **"
    break_end=$(( $(date +%s) + break_seconds ))
    while [[ "$break_end" -gt $(date +%s) ]]; do
      remaining_time=$(( break_end - $(date +%s) ))
      echo -ne "\r\e[K$(date -u -j -f %s $remaining_time +%M:%S)"  # Clear line and display remaining time
      sleep 1
    done

    # Work notification
    osascript -e 'display notification "Time to get back to work" with title "Work"'
    read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'
  done
elif [[ "$(expr substr "$os_name" 1 5)" == "Linux" ]]; then
  # Linux
  while true; do
    clear  # Clear the screen before displaying the countdown

    # Focus period
    echo "**  Focus Time (Remaining: $(date -u --date @$(($focus_seconds)) +%M:%S)) **"
    focus_end=$(( $(date +%s) + focus_seconds ))
    while [[ "$focus_end" -ge $(date +%s) ]]; do
      remaining_time=$(( focus_end - $(date +%s) ))
      echo -ne "\r\e[K$(date -u --date @$(($remaining_time)) +%M:%S)"  # Clear line and display remaining time
      sleep 1
    done

    # Break notification
    notify-send "Break" "Time to walk and rest"
    read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'

    # Break period
    echo "** ☕️ Break Time (Remaining: $(date -u --date @$(($break_seconds)) +%M:%S)) **"
    break_end=$(( $(date +%s) + break_seconds ))
    while [[ "$break_end" -ge $(date +%s) ]]; do
      remaining_time=$(( break_end - $(date +%s) ))
      echo -ne "\r\e[K$(date -u --date @$(($remaining_time)) +%M:%S)"  # Clear line and display remaining time
      sleep 1
    done

    # Work notification
    notify-send "Work" "Time to get back to work"
    read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'
  done
else
  echo "Error: Your OS is currently not supported."
fi
