#! /bin/bash

function FindOnWindows
{
	echo 'Assuming Windows'
	echo ''
	echo 'Testing names'
#	TestName "clang-format"; if [ $? -eq 0 ]; then return 0; fi
	TestName "clang-format-2.6"; if [ $? -eq 0 ]; then return 0; fi
}

function FindOnLinux
{
	echo "Assuming Linux"
}

function TestName
{
	echo -n "$1 "
	ERROR=$( eval $1 -h 2>&1 >/dev/null )
	if [ -z "$ERROR" ]; then
		echo "[Verified]"
		formatExecutable=$1
		return 0;
	fi
	echo "[Failed]"
	return 1;
}

case "$OSTYPE" in
  linux*)   FindOnLinux ;;
  win*)     FindOnWindows ;;
  msys*)   	FindOnWindows ;;
  cygwin*)  echo "Cygwin" ;;
  *)        echo "'Unknown $OSTYPE' $OSTYPE";;
esac

echo ''
if [ -z  $formatExecutable ]; then 
	echo "Did not find executeable" | tee >> 2
	exit 1
fi

echo "Found executable `which $formatExecutable`"
exit 0