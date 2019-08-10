#!/bin/zsh

# Symlink dotfiles
ln -nfs ~/dotfiles/config/nvim/init.vim ~/.config/nvim/init.vim
ln -nfs ~/dotfiles/config/nvim/coc-settings.json ~/.config/nvim/coc-sesttings.json

ln -nfs ~/dotfiles/shell/aliases ~/.aliases
ln -nfs ~/dotfiles/shell/zshrc ~/.zshrc

ln -nfs ~/dotfiles/git/gitattributes ~/.gitattributes
ln -nfs ~/dotfiles/git/gitconfig ~/.gitconfig
ln -nfs ~/dotfiles/git/gitignore ~/.gitignore

ln -nfs ~/dotfiles/bin/git-blast ~/.git-blast
ln -nfs ~/dotfiles/bin/pre-commit ~/.pre-commit

# Binaries
chmod +rwx ~/.git-blast

# Terminal & iTerm 2
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Reload zsh settings
source ~/.zshrc
