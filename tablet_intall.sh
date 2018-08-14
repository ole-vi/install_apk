#!/bin/bash
FILES=*
for f in $FILES
do
	if [ $f != "tablet_intall.sh" ]
	then
		/Users/leonardmensah/Library/Android/sdk/platform-tools/adb devices | while read line
		do
    			if [ ! "$line" = "" ] && [ `echo $line | awk '{print $2}'` = "device" ]
    			then
        			device=`echo $line | awk '{print $1}'`
        			echo "$device $@ ..."
        			/Users/leonardmensah/Library/Android/sdk/platform-tools/adb -s $device $@ install $f
    			fi
		done
		#echo "$f"
	fi
done
