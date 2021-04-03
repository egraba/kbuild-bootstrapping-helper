#!/bin/zsh

for file in patches/**/*
	if [ ! -d $file ] 
	then
		diff $file ${file:gs/patches/trunk}
	fi
