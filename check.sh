#!/bin/bash

if [ ! -d ../.git ] || [ ! -d ../Paper-API ] || [ ! -d ../Paper-Server ];
then
	echo "CubeBuildersPaperPatches should be cloned inside of the root"
	echo "of a cloned Paper repository"
fi

if [ -d ../.git/info ]; then
	pushd ../.git/info > /dev/null
		grep CubeBuildersPaperPatches exclude > /dev/null
		if [ $? -eq 1 ]; then
			echo "/CubeBuildersPaperPatches" >> exclude
		fi
	popd > /dev/null

fi
