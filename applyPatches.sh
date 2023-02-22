#!/bin/bash
cd "`dirname "$0"`"

source check.sh

PATCHES=`pwd`/patches

function patch {
	gitRepo=$1
	patchDir=$2

	if [ ! -d $patchDir ]; then
		return
	fi

	pushd $gitRepo > /dev/null

		echo "Applying patches to $gitRepo"

		git checkout master 2> /dev/null > /dev/null
		git branch -D cbpatch 2> /dev/null > /dev/null
		git checkout -b cbpatch 2> /dev/null > /dev/null

		git am --3way "$patchDir/"*.patch

		echo

	popd > /dev/null
}

patch ../Paper-API $PATCHES/api
patch ../Paper-Server $PATCHES/server
