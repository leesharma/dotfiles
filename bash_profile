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

############################
##      Path Setup        ##
############################

# Setting PATH for Python 3.4 and 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin/python:${PATH}"

# add psql to PATH
PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin"

# adding my binaries to PATH
PATH="~/GitHub/bin:$PATH"

# add cabal packages to PATH
PATH="$HOME/.cabal/bin:$PATH"

# MacPorts Installer addition on 2015-12-16_at_13:25:32:
#   adding an appropriate PATH variable for use with MacPorts.
PATH="/opt/local/bin:/opt/local/sbin:$PATH"

export PATH
# eval "$(exenv init -)" # TODO: "An error of type -10665 has occurred."
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
