#!/bin/bash

path_to_vault="/Users/maria/Documents/educación/UOC\ -\ Data\ Science/UOC-obsidian"
lista_img="deleted_img.md"

# cd $path_to_vault
cd ~/Documents/educación/UOC\ -\ Data\ Science/UOC-obsidian

if [[ -e $lista_img ]]
then
   rm $lista_img
fi

IFS=$'\n'
for pic in `find . -type f -name "*.png"`; do
	# massaged_pic=`echo $pic | sed 's/ /_/g'`
	massaged_pic=`echo $pic | rev | cut -d '/' -f1 | rev`
	# massaged_pic=`echo $pic | sed 's/\.\///'`
	# mv $pic $massaged_pic
	# echo "ORIGINAL PICS:" >> $lista_img
	# echo $pic >> $lista_img
	# echo "NEW PICS:" >> $lista_img
	
	occurrence=`grep -R $massaged_pic"]" . | wc -l`
	
	if [ "$occurrence" -eq "0" ]; then
		rm $pic
		echo "removed: "$pic
		echo $pic >> $lista_img
	fi

done