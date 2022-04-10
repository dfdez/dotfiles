export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# vi mode
bindkey -v
export KEYTIMEOUT=1

# # Use vim keys in tab complete menu:
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

alias vi=nvim
alias vim=nvim
alias cat='bat --paging=never --theme=gruvbox-dark'
# alias trm=trash-put
# alias trml=trash-list
# alias trmf=tras-empty

# # BIPI
# alias bb='cd ~/repos/bipi/bipi-api && nvm use 14.17 && MONGO_DEBUG=false npm run backend'
# alias bn='cd ~/repos/bipi/bipicar.com-nuxt && nvm use 14.17 && npm run dev'
# alias bp='cd ~/repos/bipi/bipi-portal && nvm use 14.17 && npm run start'
# alias bc='cd ~/repos/bipi/bipi-cpanel && nvm use 14.17 && npm run serve'
# alias bl='cd ~/repos/bipi/logistics-portal && nvm use 14.17 && npm run serve'
#
# alias cbb='code ~/repos/bipi/bipi-api'
# alias cbn='code ~/repos/bipi/bipicar.com-nuxt'
# alias cbp='code ~/repos/bipi/bipi-portal'
# alias cbc='code ~/repos/bipi/bipi-cpanel'
# alias cbl='code ~/repos/bipi/logistics-portal'

alias gp='git pull'
alias gc='git checkout'
alias gb='git branch'
alias ggp='git push --set-upstream origin $(git branch --show-current)'

alias xclip='scrot -s -e "xclip -selection clipboard -t \"image/png\" < \$f"'

export EDITOR=nvim
bindkey '^e' edit-command-line

export TERM=xterm-256color

# ZSH_DISABLE_COMPFIX=true

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Load ohmzsh and fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ ! -z $DISPLAY ] || startx
