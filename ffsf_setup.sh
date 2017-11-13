#! /bin/bash

workingDirectory=`pwd`

function SetupDirectory
{
	while :
	do
		echo 'Detecting workingDirectory';
		echo "$workingDirectory";
		echo 'Is this correct?';
		read key;
		if [ $key = 'yes' ] ; then
			return 0;
		elif [ $key = 'no' ]; then
			return 1;
		else
			echo 'Not an accepted answer. Please provide the answer in the form yes or no.'
		fi
	done
}

function CheckForSettingsFile
{
	echo 'Checking for previous .ffsf file.'
	if [ -f '.ffsf' ]; then
    	return 0;
	fi
	return 1;
}

function SetupFFSF
{
	return 0;
}

SetupDirectory

if [ $? -ne '0' ] ; then
	echo "Path not accepted, exiting.";
	exit 1;
fi

CheckForSettingsFile

if [ $? -ne '0' ] ; then
	echo 'Settings file not found, running entire setup.';
	name=`echo $0`
	echo $name
else
	echo 'Settings file found, maybe already setup?'
	echo 'Remove the file .ffsf and run this script again if you want to redo the setup.'
fi

