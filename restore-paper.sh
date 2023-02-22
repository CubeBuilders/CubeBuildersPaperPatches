#!/bin/bash
cd "`dirname "$0"`"

source check.sh

cd ../Paper-API
git checkout master

cd ../Paper-Server
git checkout master
