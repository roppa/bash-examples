#!/bin/bash

#start a server using ```server``` in this directory

echo "Enter URI of tar.gz i.e. http://test.com/archive.tar.gz"
read uri

echo "Enter target filename"
read filename

wget $uri -O $filename

echo "Extracting file"
tar -xzvf $filename

exit
