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

# .bashrc exists
if test -f $PATHRC ; then
	# if script already setted up
	if grep "$WATERMARK" $PATHRC >/dev/null ; then
		echo "Script already executed"
		echo "Updating $BASHCOMP"
		# update .bash_completion
		# if .bash_completion exists -> remove it
		if test -f $PATHCOMP ; then
			rm $PATHCOMP
		fi
		downloadBashCompletion
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
		downloadBashCompletion
	fi
else
	echo ".bashrc doesn't exist"
	ERROR=1
fi

exit $ERROR
