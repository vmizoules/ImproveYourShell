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
	# .bash_completion exists
	if test -f $PATHCOMP ; then
		echo "Found: '$BASHCOMP'"
		# .bashrc.backup
		if test -f $PATHRCBKP ; then
			echo "Found: '$BASHRCBKP'"
			# backup before restoring
			cp $PATHRC $PATHRCBKP2
			echo "	Restoring backup"
			cp $PATHRCBKP $PATHRC
			echo "	Remove '$BASHCOMP'"
		else
			echo "Missing: '$BASHRCBKP'"
			echo "	Only remove '$BASHCOMP'"
		fi
		# remove .bash_completion
		rm $PATHCOMP
	else
		# no .bash_completion
		echo "Missing: '$BASHCOMP'"
		echo "	Interrupt uninstall."
		echo "	Do manual restoring."
	fi
fi


