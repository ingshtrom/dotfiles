#Sets reasonable macOS defaults.


echo 'Setting reasonable defaults for OSX...'

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool true

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv
defaults write com.apple.finder AppleShowAllFiles YES

# Show all hidden files and directories
chflags -R nohidden $HOME 2> /dev/null

# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 1

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# disable press-and-hold for VSCode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool true

# faster mouse movement
# NOTE don't need it with logitech since the scaling
#      is done in the app
# defaults write -g com.apple.mouse.scaling 6

sudo mdutil -a -i on
