#! /bin/bash


function LocateFile
{
	echo -e "Attempting to locate file $1"

	if [ ! -f $1 ]; then
    	echo -e "Not found"
    	return -1;
	fi
    echo -e "Found"
	return 0;
}


