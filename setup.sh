#!/bin/zsh

declare -a FILES_TO_SYMLINK=(

  'shell/aliases'
  'shell/zshrc'

  'git/gitattributes'
  'git/gitconfig'
  'git/gitignore'

  'bin/git-blast'
)

declare -a BINARIES=(
)

# Symlink dotfiles
for file in ${FILES_TO_SYMLINK[@]}; do
  name=`echo "."${file#*/}`
  link=~/${name}
  echo "linking $link"
  ln -nfs dotfiles/$file $link
done

declare -a BINARIES=(
  '.git-blast'
)

for i in ${BINARIES[@]}; do
  echo "Changing access permissions for binary script :: ${i##*/}"
  chmod +rwx $HOME/${i##*/}
done

unset BINARIES

# Terminal & iTerm 2                                                          #
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Reload zsh settings
source ~/.zshrc
