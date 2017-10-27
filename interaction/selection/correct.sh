#!/bin/bash
#Are you sure?

while true; do
    read -p "Are you sure? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

exit 0
