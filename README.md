ShortCommands
=============

Some 'one line' commands to launch scripts :
------------------

BashCompletion install or update :

    bash <(curl -Ls http://git.io/vT9wm)

BashCompletion remove :

	bash <(curl -Ls http://git.io/vTdtT)

Screenshots :
-------------

Normal prompt :


![Screenshot Prompt1](/screenshot/prompt1.jpg?raw=true "Normal prompt")


Normal prompt with git :


![Screenshot Prompt2](/screenshot/prompt2.jpg?raw=true "Normal prompt with git")


Root prompt :


![Screenshot Prompt3](/screenshot/prompt3.jpg?raw=true "Root prompt")



Tips
----

You can add your own bash modifications by creating a file called : (in your homedir)

	.bash_personnal_completion

Example for your personnal file (shoud be in ~/.bash_personnal_completion) :

```bash
# display a greeting
greeting
# remove an alias already setted up
unalias cgrep
# set new personnal alias
alias hello='echo HelloWorld'
# create your own var
export mydir='/home/myName/myFavoriteDir/'
```

Credits
-------

By vmizoules
