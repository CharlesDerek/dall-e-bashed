#!/bin/bash

# Variables:
greeting1="Hello! We noticed you have a"
greeting2="operating system"
unsupported="Unfortunately we do not support automated installers for this operation using your operating system at the current moment. We apologize for the inconvenience."

echo "Initializing Scaffold Installation..."

# Script:
if [ "$(uname)" == "Darwin" ]; then
    # Mac:
    echo "$greeting1 mac $greeting2"
    #echo "$unsupported"
    if ! [ -x "$(command -v pip)" ]; then
        echo "pip is not installed. Installing pip..."
        brew install python3
        echo "pip installed"
    fi
    if ! [ -x "$(command -v dall-e)" ]; then
        echo "DALL-E is not installed. Installing DALL-E..."
        brew install dall-e
        echo "DALLE Installation Successfully Completed"
    fi
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Linux (Debian Based Distros):
    echo "$greeting1 linux $greeting2"

    if ! [ -x "$(command -v pip)" ]; then
        echo "pip is not installed. Installing pip..."
        sudo apt-get install python-pip
    fi
    if ! type "DALL-E" > /dev/null; then
        echo "DALL-E is not installed. Installing DALL-E..."
        pip install -r requirements.txt
        sudo pip install DALL-E
        echo "DALLE Installation Successfully Completed"
    fi
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Windows:
    echo "$greeting1 windows $greeting2"
    # PIP:
    if ! [ -x "$(command -v pip)" ]; then
        echo "pip is not installed. Installing pip..."
        curl -O https://bootstrap.pypa.io/get-pip.py
        python get-pip.py
        rm get-pip.py
        echo "PIP Installation Successfully Completed"
    fi
    # CURL:
    if ! [ -x "$(command -v curl)" ]; then
        echo "curl is not installed. Installing curl..."
        apt-get install curl
        echo "CURL Installation Successfully Completed"
    fi
    # DALL-E:
    if ! type "DALL-E" > /dev/null; then
        echo "DALL-E is not installed. Installing DALL-E..."
        curl -O https://bootstrap.pypa.io/get-pip.py
        python get-pip.py
        pip install -r requirements.txt
        pip install DALL-E
        echo "DALLE Installation Successfully Completed"
    fi
fi