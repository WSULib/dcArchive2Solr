#!/bin/bash

DCFILE=''

while getopts ':f:' flag; do
	case $flag in
		f) DCFILE="${OPTARG}" >&2 ;;
		\?) echo "Option -$OPTARG requires an argument." >&2 exit 1 ;;
		:) error "Unexpected option ${flag}" >&2 exit 1 ;;
	esac
done


if [ -n "${DCFILE}" ]; then

	# untar file
	tar -xvf $DCFILE
	DCFOLDER=`tar -tzf $DCFILE | head -1 | cut -f1 -d"/"`

	# remove all the pdfs
	find $DCFOLDER -type f \! -regex '.*\.xml' -delete

	# put resulting directory into a compressed file
	tar -cvf digitalcommons.tar.gz $DCFOLDER

	# remove input directory
	# DIRECTORY='./input'
	# if [ -d "$DIRECTORY" ]; then
	#   rm -r $DIRECTORY
	# fi

	# remake input directory
	mv $DCFOLDER $DIRECTORY
fi
