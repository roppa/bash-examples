#!/bin/bash

#start a server using ```server``` in this directory

echo "Get text file from http://localhost:8000/test.txt"
wget http://localhost:8000/test.txt

exit
