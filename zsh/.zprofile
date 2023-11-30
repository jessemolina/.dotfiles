# source common
[ -f ~/.config/zsh/common ] && source ~/.config/zsh/zsh_exports

# source dev
[ -f ~/.config/zsh/dev ] && source ~/.config/zsh/dev

# source operating system
if [[ "$(uname)" == "Darwin" ]]; then
    [ -f ~/.config/zsh/macos ] && source ~/.config/zsh/macos
elif [[ "$(uname)" == "Linux" ]]; then
    [ -f ~/.config/zsh/linux ] && source ~/.config/zsh/linux
fi

# source personal
[ -f ~/.config/zsh/personal ] && source ~/.config/zsh/personal

# source work
[ -f ~/.config/zsh/work ] && source ~/.config/zsh/work
