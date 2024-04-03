

# Learn with Us: Bash Scripting 
Welcome to the Learn with Us program on Bash scripting,  In this program, we'll cover the essentials of Bash scripting to help you automate tasks and streamline your workflow on Unix-based systems like Linux and macOS.

## lwu-bash.md 
In the lwu-bash.md file, you'll find comprehensive tutorials, explanations, and examples covering various aspects of Bash scripting. Whether you're a beginner looking to grasp the fundamentals or an experienced user seeking to enhance your scripting skills, this markdown file will serve as your guide.

# Tomato Timer Script

As part of our practical exercises, we've included a Pomodoro script named tomato.sh. The Pomodoro Technique is a time management method that uses a timer to break work into intervals, traditionally 25 minutes in length, separated by short breaks.

## Description
tomato.sh is a Bash script implementation of the Pomodoro Technique. It helps you manage your work sessions effectively by timing your work intervals and breaks.

## Features

- **Customizable Focus and Break Times:** Adjust the duration of your work sessions and breaks according to your preferences.
- **Operating System Compatibility:** Supports macOS and Linux operating systems.
- **Notification Alerts:** Receive notifications when each work session or break ends, keeping you on track with your schedule.

## Usage

By default, the script sets the focus time to 25 minutes and the break time to 5 minutes. However, you can override these defaults by providing your desired focus and break times as arguments.

1. Clone the repository:
   
   `git clone https://github.com/Manipal-OSF/shell-scripts`

2. Navigate to the cloned directory:
   
   `cd shell-scripts`

3. Run the script:
   
   `./tomato.sh`

   Optionally, you can specify custom focus and break times:
   
   `./tomato.sh 30 10`
   
   This will set the focus time to 30 minutes and the break time to 10 minutes.

## License

This script is distributed under the BSD 3-Clause License.
