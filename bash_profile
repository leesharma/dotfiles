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

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# add psql to PATH
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin"

# adding my binaries to PATH
export PATH="~/GitHub/bin:$PATH"

# add cabal packages to PATH
export PATH="$HOME/.cabal/bin:$PATH"

##
# Your previous /Users/lee/.bash_profile file was backed up as /Users/lee/.bash_profile.macports-saved_2015-12-16_at_13:25:32
##

# MacPorts Installer addition on 2015-12-16_at_13:25:32: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

