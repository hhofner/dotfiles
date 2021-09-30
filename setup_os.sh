echo "Setting up for MacOS"

which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi
brew install neovim
brew install tmux
brew install docker
brew install docker-compose

brew install yarn
# Python stuff here

brew install spotify-tui
brew install --cask anki
brew install --cask spotify
brew install --cask firefox
brew install --cask webstorm
brew install --cask visual-studio-code
