# NOTE:
# .bash_profile is run under the conditions of a new login. therefore, it
# is only run once for that shell window (in Terminal.app's case). however,
# .bashrc is run under the conditions of a sub-shell and .bash_profile is
# skipped in a sub-shell. so, what does that mean?

# in .bash_profile, you can run commands that write to stdout. you wouldn't
# want chatty commands when you start a sub-shell. the PATH variable should be
# finalized in .bash_profile. this is so that sub-shells don't
# alter/prepend/append to it. since fink's init sets PATH and exports some
# variables, run fink's init from .bash_profile. also, run your .bashrc from
# .bash_profile

# .bashrc is the driver for everything else, aliases, functions, completions,
# prompt-string, env settings, etc. They should be silent settings, i.e., no
# noise to stdout.

###########################
##        Colors         ##
###########################

# CLICOLOR and LSCOLORS are used by 'ls' to color things
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
# LS_COLORS is used by certain unix-y things, like 'tree' to color things
export LS_COLORS='no=00:fi=00:di=34:ln=35:pi=33:so=32:bd=34;46:cd=34;43:ex=31:su=30;41:sg=30;46:tw=30;42:ow=30;43:'

# Colorize LESS (man pages)
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)

###########################
##      Dev Setup        ##
###########################

# Setting default editor to vim
export EDITOR='/usr/bin/vim'

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# adding my binaries to the path
export PATH="~/GitHub/bin:$PATH"

export NVM_DIR="/Users/lee/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

###########################
##        Aliases        ##
###########################

# ls long and all
alias ls='ls -la'
# tree all
alias tree='tree -a'

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

export NVM_DIR="/Users/lee/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

