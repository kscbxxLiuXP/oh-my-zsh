clone_from_git(){
  echo "Cloning from git..."
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

clone_from_gitee(){
  echo "Cloning from gitee..."
  git clone https://gitee.com/kanderWall/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://gitee.com/kanderWall/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

}

ZSHRC_FILE="$HOME/.zshrc"

if [ $# -eq 0 ] || [ "$1" = "git" ]; then
  clone_from_git
elif [ "$1" = "gitee" ]; then
  clone_from_gitee
else
  echo "Invalid option '${1}'. Please use 'git' or 'gitee'."
  exit 1
fi

# replace theme
sed -i '' -e 's|^[[:space:]]*ZSH_THEME[[:space:]]*=[[:space:]]*".*"|ZSH_THEME="powerlevel10k/powerlevel10k"|' "$ZSHRC_FILE"


#replace plugin

