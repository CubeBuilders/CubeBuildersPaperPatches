#!/bin/bash
cd "`dirname "$0"`"

source check.sh

PATCHES=`pwd`/patches

function rebuildPatches {
	gitRepo=$1
	patchDir=$2

	mkdir -p $patchDir

	pushd $gitRepo > /dev/null

		git format-patch --no-stat -N -o "$patchDir" master

	popd > /dev/null
}

rebuildPatches ../Paper-API $PATCHES/api
rebuildPatches ../Paper-Server $PATCHES/server

git add -A patches/*/*.patch
