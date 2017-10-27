#!/bin/bash

#start a server using ```server``` in this directory

echo "Get text file from http://localhost:8000/downloaded.tar.gz"
wget http://localhost:8000/test.tar.gz -O downloaded.tar.gz

echo "Extracting file"
tar -xzvf downloaded.tar.gz

exit
