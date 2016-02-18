#!/bin/bash

DCFILE=''

while getopts 'f:*' flag; do
	case "${flag}" in
		f) DCFILE="${OPTARG}" ;;
		*) error "Unexpected option ${flag}" ;;
	esac
done

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
