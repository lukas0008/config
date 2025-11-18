#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval $(thefuck --alias)

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='\[\e[32m\]┌──(\[\e[94;1m\]\u\[\e[94m\]@\[\e[94m\]\h\[\e[0;32m\])-[\[\e[38;5;39;1m\]\w\[\e[0;32m\]] [\[\e[32m\]$?\[\e[32m\]]\n\[\e[32m\]╰─\[\e[94;1m\]\$\[\e[0m\] '

alias aur-mirrors='sudo mkdir -p ~/Documents/mirrorlists/ && sudo cp /etc/pacman.d/mirrorlist ~/Documents/mirrorlists/mirrorlist_$(date +%Y-%m-%d_%H-%M-%S-%3N) && sudo reflector --latest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist --country'

alias docken='sudo systemctl start docker && sudo docker container ls -a'
alias dockerend='sudo docker container ls -a | awk '\''{print $1}'\'' | tail -n +2 | xargs -I_ docker rm _'
alias dock-postgres='sudo docker run --name postgres -e POSTGRES_PASSWORD=password -d postgres'

alias ..='cd ..'
alias home='cd ~'
alias conf='cd ~/.config'
alias code='cd ~/code'
alias rust='cd ~/code/rust'
alias c='cd ~/code/c'
alias web='cd ~/code/web'
alias asm='cd ~/code/asm'
alias rm='rm -i'
alias notes='cd ~/Documents/notes'

eval "$(zoxide init bash)"

export PATH="$PATH:/usr/lib/elixir/bin"
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
