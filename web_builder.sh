#!/bin/bash
if [ $# -le 0 ]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

file_path=$1

for web in $(cat websites.txt); do
    name="$(echo $web | awk -F "/" '{ print $9 }' | awk -F "." '{ print $1 }')"
    wget $web -P /tmp/
    unzip /tmp/$name.zip -d /var/
    rm -rf /tmp/*.zip
    mkdir /var/www/html/$name
    mv /tmp/*$name*/* /var/www/html/$name/
done