#!/bin/bash

printf "https://s3-ap-southeast-1.amazonaws.com/paper-%s.pdf\n" {1111..9999}>./url.txt

cat ./url.txt | while read LINE; do
    echo "$LINE"
    export FILETYPE="$(curl -sI "$LINE" | grep Content-Type | cut -d: -f2 | cut -d/ -f2)"
    if [[ "$FILETYPE" = "pdf" ]]; then
        echo "$LINE" >> ok.txt
        echo "Working"
    else
        echo "FucK"
    fi
done
