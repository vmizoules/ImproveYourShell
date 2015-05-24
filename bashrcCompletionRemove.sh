#!/bin/bash

USER=`whoami`
BASHRC=".bashrc"
BASHRCBKP=".bashrc.backup"
BASHRCBKP2=".bashrc.before_uninstall.backup"
BASHCOMP=".bash_completion"
PATHRC=$HOME"/"$BASHRC
PATHRCBKP=$HOME"/"$BASHRCBKP
PATHRCBKP2=$HOME"/"$BASHRCBKP2
PATHCOMP=$HOME"/"$BASHCOMP
ERROR=0

WATERMARK="#BashRcCompletionByVMizoules"
WATERMARKEND="#end_of_BashRcCompletionByVMizoules"
BASHCOMPSCRIPTURL='http://git.io/vT9MS'

# show username
echo "User: $USER"

# .bashrc exists
if test -f $PATHRC ; then
	echo "Found: '$BASHRC'"
	# detect installation script
	if grep "$WATERMARK" $PATHRC >/dev/null ; then
		# .bashrc.backup exists
		if test -f $PATHRCBKP ; then
			echo "	Found: '$BASHRCBKP'"
			# backup before restoring
			cp $PATHRC $PATHRCBKP2
			echo "		Restoring backup"
			cp $PATHRCBKP $PATHRC
		else
			echo "	Missing: '$BASHRCBKP'"
			echo "		Do nothing."
		fi
	else
		echo "	No trace of installation in '$BASHRC'"
		echo "	Do nothing."
	fi
fi

# .bash_completion exists
if test -f $PATHCOMP ; then
	echo "Found: '$BASHCOMP'"
	echo "	Remove '$BASHCOMP'"
	# remove .bash_completion
	rm $PATHCOMP
else
	# no .bash_completion
	echo "Missing: '$BASHCOMP'"
	echo "	Do nothing."
fi


