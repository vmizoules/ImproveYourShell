#!/bin/bash

USER=`whoami`
BASHRC=".bashrc"
BASHCOMP=".bash_completion"
PATHRC=$HOME"/"$BASHRC
PATHCOMP=$HOME"/"$BASHCOMP
ERROR=0

WATERMARK="#BashRcCompletionByVMizoules"
BASHCOMPSCRIPT='echo -e && echo "Bash modded by vmizoules" && echo -e'
WATERMARKEND="#end_of_BashRcCompletionByVMizoules"

# .bashrc exists
if test -f $PATHRC ; then
	# if script already setted up
	if grep "$WATERMARK" $PATHRC >/dev/null ; then
		echo "Script already executed"
		echo "Updating $BASHCOMP"
		# if .bash_completion exists -> remove it
		if test -f $PATHCOMP ; then
			rm $PATHCOMP
		fi
		# update .bash_completion
		echo $BASHCOMPSCRIPT > $PATHCOMP
	else
		echo "First execute"
		# mod .bashrc
		echo -e >> $PATHRC
		echo $WATERMARK >> $PATHRC
		echo "if test -f $PATHCOMP ; then" >> $PATHRC
		echo "    . $PATHCOMP" >> $PATHRC
		echo "fi" >> $PATHRC
		echo $WATERMARKEND >> $PATHRC
		# create .bash_completion
		echo $BASHCOMPSCRIPT > $PATHCOMP
	fi
else
	echo ".bashrc doesn't exist"
	ERROR=1
fi

exit $ERROR

comm