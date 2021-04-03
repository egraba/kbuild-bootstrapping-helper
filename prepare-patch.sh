#!/bin/zsh

#
# Download current trunck of kBuild (releases are pretty old)."
#
svn co https://svn.netlabs.org/repos/kbuild/trunk/

for file in patches/**/*
	if [ ! -d $file ] 
	then
		diff $file ${file:gs/patches/trunk}
	fi
