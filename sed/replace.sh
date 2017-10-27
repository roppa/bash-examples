#!/bin/bash

#sed is stream editing, so it is really fast

#config example, read a file and replace placeholders with values

echo "Modifying config.json, writing to newconfig.json"
name="myfirstapp"
version="1.0.0"
path="\/api\/path\/"
sed -e 's/${name}/'$name'/g' -e 's/${version}/'$version'/g' -e 's/${path}/'$path'/g' < config.json > newconfig.json
echo "Done"
