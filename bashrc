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
##      Dev Setup        ##
###########################

export EDITOR='/usr/bin/nvim'
export CLICOLOR=1 # colorize ls


###########################
##        Aliases        ##
###########################

alias vim="nvim"
alias ll="ls -la; printf \"\033[0;33mcurrent:\033[0m `pwd`\n\""
alias homebrew="brew update;brew upgrade;brew cleanup"

# Install gems locally to keep dependencies isolated. For more info,
#   http://ryan.mcgeary.org/2011/02/09/vendor-everything-still-applies

alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias bu="b update"
alias bp="b package --all"
alias be="b exec"
alias binit="bi && bp && echo 'vendor/ruby' >> .gitignore"

