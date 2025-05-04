autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.
ZSH_AUTOSUGGEST_STRATEGY=(completion history match_prev_cmd)

## VIM BINDINGS & CURSOR
bindkey -v 
export KEYTIMEOUT=1

function zle-keymap-select {
if [[ ${KEYMAP} == vimcmd ]]; then
    echo -ne '\e[1 q'

else
    echo -ne '\e[5 q'
fi
}

zle -N zle-keymap-select
function zle-line-init {
echo -ne "\e[5 q"
}

zle -N zle-line-init

echo -ne '\e[5 q' # For startup
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
