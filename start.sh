#!/bin/sh

echo $FLAG > ./flag.txt

./websocketd --binary=true --port=$PORT ./chall
