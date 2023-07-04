#!/bin/bash
showname(){
    echo Hello $1
    if [ ${1,,} = seokhee ]; then
	    return 0
    else
	return 1
    fi
}

showname seokhee
