#!/bin/bash


if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

FILENAME=$1

if [ ! -f "$FILENAME" ]; then
    echo "File '$FILENAME' not found."
    exit 1
fi

while IFS= read -r USERNAME; do
    if id "$USERNAME" &>/dev/null; then
        sudo userdel -r "$USERNAME"
        echo "User '$USERNAME' has been deleted without deleting the home directory."
    else
        echo "User '$USERNAME' does not exist."
    fi
done < "$FILENAME"
