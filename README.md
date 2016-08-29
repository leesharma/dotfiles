# My Dotfiles

This is a copy of my personal dotfiles. I keep them on GitHub so that it's easy
to import my preferred configuration onto new machines.

This is a homebrewed solution (inspired by someone's blog post, but I can't
actually find it again).


### How to Use

To start using, clone the repository into your home directory:

```bash
$ cd ~
$ git clone git@github.com:leesharma/dotfiles.git
$ cd dotfiles
```

To "archive" your current set of dotfiles, run:

```bash
$ makesymlinks.sh
```

This will symlink the files in the list of files (found in `makesymlinks.sh`)
from the `~/dotfiles` directory to the home directory. It will also move
existing dotfiles that match the included files into the `~/old_dotfiles`
directory. They can be removed, moved, combined, etc. from there.


### License

[MIT][LICENSE] - please feel free to fork, clone, use, or modify anything you
find here.

