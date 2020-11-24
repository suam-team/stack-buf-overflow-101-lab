#!/bin/sh

echo $FLAG > ./flag.txt

sudo -u ctf ./websocketd --binary=true --port=$PORT ./chall
