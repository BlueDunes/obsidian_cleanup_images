#!/bin/bash

path_to_vault="YOUR PATH"
list_img="deleted_img.md"

cd $path_to_vault

if [[ -e $list_img ]]
then
   rm $list_img
fi

IFS=$'\n'
# Finds images in your vault and takes the file name.
for pic in `find . -type f -name "*.png"`; do
	massaged_pic=`echo $pic | rev | cut -d '/' -f1 | rev`
	
	# Counts the occurences
	occurrence=`grep -R $massaged_pic"]" . | wc -l`
	
	# If the image doesn't appear in any note it removes it
	# and adds it to a list of deleted images
	if [ "$occurrence" -eq "0" ]; then
		rm $pic
		echo "removed: "$pic
		echo $pic >> $list_img
	fi

done