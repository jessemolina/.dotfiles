alias k="kubectl"
alias tau="emacs -nw"

eval "$(/opt/homebrew/bin/brew shellenv)"

export GH=$HOME/Lab/github
export LXIO=$HOME/Lab/lambdaxio
export GOPATH=/usr/local/go
export CARGO_HOME=$HOME/.cargo
export PATH=$PATH:$HOME/.config/emacs/doomemacs/bin
export PATH=$PATH:$HOME/.rd/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$CARGO_HOME/bin

export PKG_CONFIG_PATH=/usr/local/Cellar/zlib/1.2.8/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig

export GREENLIGHT_DB_DSN="postgres://greenlight:pa55word@localhost/greenlight?sslmode=disable"

set -o vi

PS1='\[\e[01;32m\]\u\[\e[m\]:\[\e[01;34m\]\w\[\e[m\]$ '
