#!/bin/bash

USER=`whoami`
BASHRC=".bashrc"
BASHCOMP=".bash_completion"
PATHRC=$HOME"/"$BASHRC
PATHCOMP=$HOME"/"$BASHCOMP
ERROR=0

WATERMARK="#BashRcCompletionByVMizoules"
WATERMARKEND="#end_of_BashRcCompletionByVMizoules"
BASHCOMPSCRIPTURL='http://git.io/vT9MS'

function downloadBashCompletion {
	wget -q $BASHCOMPSCRIPTURL -O - > $PATHCOMP
}

# show username
echo "User: $USER"

# .bashrc exists
if test -f $PATHRC ; then
	# if script already setted up
	if grep "$WATERMARK" $PATHRC >/dev/null ; then
		echo "Updating $BASHCOMP"
		# update .bash_completion
		# if .bash_completion exists -> remove it
		if test -f $PATHCOMP ; then
			rm $PATHCOMP
		fi
		downloadBashCompletion
	else
		echo "First execution."
		echo "Modding $BASHRC"
		# mod .bashrc
		echo -e >> $PATHRC
		echo $WATERMARK >> $PATHRC
		echo "if test -f $PATHCOMP ; then" >> $PATHRC
		echo "    . $PATHCOMP" >> $PATHRC
		echo "fi" >> $PATHRC
		echo $WATERMARKEND >> $PATHRC
		echo "Creating $BASHCOMP"
		# create .bash_completion
		downloadBashCompletion
	fi
	echo "Finish!"
else
	echo ".bashrc doesn't exist"
	ERROR=1
fi

exit $ERROR
