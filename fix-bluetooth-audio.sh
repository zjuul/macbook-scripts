#!/bin/bash
ACTION=$1
VALUE=$2

if [ "${ACTION}" = "-k" ] ; then
	echo "killing and restarting audio (via sudo)"
	sudo killall coreaudiod
	exit $?
fi

if [ "${ACTION}" = "-q" ] ; then
	if [ ! -e ${VALUE} ] ; then
		echo "Setting quality to ${VALUE}"
		defaults write com.apple.BluetoothAudioAgent \
			"Apple Bitpool Min (editable)" -int ${VALUE}
		exit $?
	fi
fi

echo "Usage:"
echo "Restart audio"
echo "	$0 -k"
echo "Set quality (e.g. to 60)"
echo "  $0 -q 60"
