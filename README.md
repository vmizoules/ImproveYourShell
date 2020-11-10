Improve your Shell
=============

You use Linux shell every day? You make some mistyping? You like colors? Or you're just lazy?

This trick will change your life!

You just have to type in a single command line in your shell. Then your shell will be "patched".

_(no root required, just patch user's ".bashrc")_


Commands
--------

Install or update :

    bash <(curl -Ls http://git.io/vT9wm)

Remove :

    bash <(curl -Ls http://git.io/vTdtT)

Try just for current session : (No file will be installed on your computer)

    source <(curl -Ls http://git.io/vT9MS)


Features
------

- New prompt (see screenshots below)
- Auto cd (just type a dir name into bash)
- Spell check for directories
- Secure commands like rm/chmod to avoid some regrettable things
- Retrieves typos (like "sl" for "ls" or "gut" for "git")
- Many usefull alias
  - git : gs, ga, gc...
  - path : www, home, cd., cd.., cd..., cd-, ..
  - sysadmin : ports, fastping, psmem10, pscpu10, webshare
- Somes cool functions
  - gitAliasSetUp : to configure some shortcut in git (git st, git co, ...)
  - greeting : to welcome you
- Easy to add you own customization (cf: ["Additionnals tips" part](##Additionnals-tips) )

_To know all features, you can take a look at the "bash_completion" file._

Prompt screenshots
--------

Normal user :


![Screenshot Prompt1](/screenshot/prompt1.jpg?raw=true "Normal prompt")


Normal user with git :


![Screenshot Prompt2](/screenshot/prompt2.jpg?raw=true "Normal prompt with git")


Root user :


![Screenshot Prompt3](/screenshot/prompt3.jpg?raw=true "Root prompt")


SSH connection :


![Screenshot Prompt4](/screenshot/prompt4.png?raw=true "Prompt on SSH")

Additionnals tips
----

You can add your own bash modifications by creating a file called : _(in your homedir)_

    .bash_personnal_completion

Example for your personnal file : _(shoud be in ~/.bash_personnal_completion)_

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

By vmizoules - https://github.com/vmizoules/ImproveYourShell
