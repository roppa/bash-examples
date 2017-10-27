#!/bin/bash

if [ ! -f ~/.secretexample ]; then
  echo "Secret password file does not exist"
  exit 1
fi

echo "Secret password file exists!"
exit 0
