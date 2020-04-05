#!/bin/bash

if [ $(whoami) == "root" ];
then
	HOME_DIR=$(eval echo ~$SUDO_USER)

	if [ -f /usr/bin/timepointer ];
	then
		echo "timepointer is aleready installed"

	else
		echo "installing timepointer"

		echo "creating working dir"
		mkdir $HOME_DIR/.timepointer
		mkdir $HOME_DIR/.timepointer/timepointer

		echo "copying files"
		cp -v timepointer/*.py $HOME_DIR/.timepointer/timepointer/
		cp -v timepointer/timepointer.sh $HOME_DIR/.timepointer/timepointer/
		cp -v help.txt $HOME_DIR/.timepointer/

		echo "creating json file"
		touch $HOME_DIR/.timepointer/timepointer/timepointer.json

		echo "writing data to json file"
		echo '{ "start-time": "", "csv-path": "", "status": "stopped" }' >> $HOME_DIR/.timepointer/timepointer/timepointer.json

		echo "creating symlink"
		ln -sv $HOME_DIR/.timepointer/timepointer/timepointer.sh /usr/bin/timepointer

		echo "setting permissions"
		chown -Rv $SUDO_USER $HOME_DIR/.timepointer

		if [ -f /usr/bin/timepointer ];
		then
			echo
			echo "timepointer has been installed sucessfully"
			echo "for more information type: timepointer --help"
		fi
	fi
else
	echo "please run this script with sudo"
fi