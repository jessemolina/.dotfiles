autoload -Uz vcs_info
#precmd() { vcs_info }
#zstyle ':vcs_info:*' enable git svn
#PROMPT='%F{cyan}%n@%m%f %F{yellow}%~%f λ '
#PROMPT='%F{cyan}%n@%m%f %F{yellow}%~%f ${vcs_info_msg_0_} λ '
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
precmd () { vcs_info }
PS1='%F{5}[%F{2}%n%F{5}] %F{3}%3~ ${vcs_info_msg_0_}%f%# '

[[ -f ~/.zprofile ]] && . ~/.zprofile
