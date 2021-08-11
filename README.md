# ingshtrom does dotfiles

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **Brewfile**: This is a list of applications for [Homebrew Cask](https://caskroom.github.io) to install: things like Chrome and 1Password and Adium and stuff. Might want to edit this file before running any initial setup.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## Get Started

Create a `~/.localrc` file with the following in it:
```
# NOTE: Permissions => public_repo
export DOTFILES_GITHUB_TOKEN=<token>
```

## install

Run this:

```sh
git clone https://github.com/ingshtrom/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bin/dotfiles
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dotfiles` does all of the heavy lifting and should be run periodically to ensure the system is up to date! I like to run it daily to pick up a lot of various updates to tools I use at work.

Manual installs for OSX:
* [Hammerspoon](https://github.com/Hammerspoon/hammerspoon/releases)
* Zoom, if used by work

Manual installs for Linux:
* Zoom, if used by work

## Change themes
Do a grep to search for places to change it based on the theme you want to switch to, dark or light
```
☸ docker-desktop in .dotfiles on  main [$!⇡]  ☁️ empty 🐳
🚀💥 grep 'DARK theme' . -r
./nvim/config/main.vim:" DARK theme
./kitty/kitty.conf:## DARK theme
./zsh/zshrc.symlink:# DARK theme
./git/gitconfig.symlink:  # DARK theme

☸ docker-desktop in .dotfiles on  main [$!⇡]  ☁️ empty 🐳
🚀 grep 'LIGHT theme' . -r
./nvim/config/main.vim:" LIGHT theme
./kitty/kitty.conf:## LIGHT theme
./zsh/zshrc.symlink:# LIGHT theme
./git/gitconfig.symlink:  # LIGHT theme

```

