#!/bin/bash

USER=`whoami`
BASHRC=".bashrc"
BASHRCBKP=".bashrc.backup"
BASHCOMP=".bash_completion"
PATHRC=$HOME"/"$BASHRC
PATHRCBKP=$HOME"/"$BASHRCBKP
PATHCOMP=$HOME"/"$BASHCOMP
ERROR=0

WATERMARK="#BashRcCompletionByVMizoules"
WATERMARKEND="#end_of_BashRcCompletionByVMizoules"
BASHCOMPSCRIPTURL='http://git.io/vT9MS'

function downloadBashCompletion {
	wget -q $BASHCOMPSCRIPTURL -O - > $PATHCOMP
}

function installBashCompletion {
	echo "First execution."
	echo "	Save '$BASHRC'"
	cp $PATHRC $PATHRCBKP
	# mod .bashrc
	echo "	Modding '$BASHRC'"
	echo -e >> $PATHRC
	echo $WATERMARK >> $PATHRC
	echo "if test -f $PATHCOMP ; then" >> $PATHRC
	echo "    source $PATHCOMP" >> $PATHRC
	echo "fi" >> $PATHRC
	echo $WATERMARKEND >> $PATHRC
	echo "	Creating '$BASHCOMP'"
	# create .bash_completion
	downloadBashCompletion
}

function updateBashCompletion {
	# if .bash_completion exists -> move it to check if there is update later
	if test -f $PATHCOMP ; then
		mv $PATHCOMP ${PATHCOMP}.bak
	fi
	downloadBashCompletion
	if test -f ${PATHCOMP}.bak ; then
		# no modification
		if test `diff ${PATHCOMP} ${PATHCOMP}.bak|wc -l` -eq "0" ; then
			echo "Already up-to-date."
		else
			echo "Updating '$BASHCOMP'"
		fi
		rm ${PATHCOMP}.bak
	else
		echo "Downloading '$BASHCOMP'"
	fi
}

# show username
echo "User: $USER"

# .bashrc exists
if test -f $PATHRC ; then
	# if script already setted up
	if grep "$WATERMARK" $PATHRC >/dev/null ; then
		updateBashCompletion
	else
		installBashCompletion
	fi
else
	echo ".bashrc doesn't exist"
	ERROR=1
fi

if test $ERROR -eq 0 ; then
	echo "Ok!"
else
	echo "[ERROR] An error occured during the process."
fi

exit $ERROR
