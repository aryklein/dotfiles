# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## History
HISTFILE=~/.zsh_history
HISTSIZE=2500
SAVEHIST=2500

## Set vi mode
bindkey -v

## The following lines was added by compinstall
zstyle :compinstall filename "'$HOME/.zshrc'"

## Basic auto/tab completion with menu style
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

## Command Correction
#setopt correctall

# Interactive comments
setopt interactivecomments

## Reverse search
bindkey '^R' history-incremental-search-backward
bindkey '^F' history-incremental-pattern-search-forward

## Remove command lines from the history list when the first character on the line is a space
setopt HIST_IGNORE_SPACE

## Enable autosuggestion plugin
if [[ -f  /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

## Enable syntax-highlighting plugin
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # No colors for comments
    export ZSH_HIGHLIGHT_STYLES[comment]="none"
fi

## Enable and configure fzf
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh
if type fd > /dev/null; then
    # Setting fd as the default command for fzf
    export FZF_DEFAULT_COMMAND='fd --type f'
    # To apply the fd to CTRL-T as well
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    # Dracula theme for fzf
    export FZF_DEFAULT_OPTS='
    --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
    --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
    --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
    --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
fi

## Key bindings (https://wiki.archlinux.org/index.php/Zsh#Key_bindings)
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[ShiftTab]="${terminfo[kcbt]}"

# setup key accordinglydd
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[ShiftTab]}"  ]] && bindkey -- "${key[ShiftTab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget
    function zle_application_mode_start {
        echoti smkx
    }
    function zle_application_mode_stop {
        echoti rmkx
    }
    add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

## History search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

## Terminal emulator tab title
autoload -Uz add-zsh-hook

function xterm_title_precmd () {
    print -Pn -- '\e]2;%n@%m:%~\a'
    [[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

if [[ "$TERM" == (screen*|xterm*|rxvt*|tmux*|putty*|konsole*|gnome*) ]] && [[ "$TERM" != (xterm-kitty) ]]; then
    add-zsh-hook -Uz precmd xterm_title_precmd
fi

## Colored Man Pages
function man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

## Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='colordiff'
alias history='history 0'
alias ip='ip -color=auto'
# Terminal issues with SSH in Kitty
alias ssh='TERM="xterm-256color" ssh'
# replace vim by nvim if it is installed
if [[ -x /usr/bin/nvim ]]; then alias vim='nvim'; fi
# replace cat with bat if it is installed
if [[ -x /usr/bin/bat ]]; then alias cat='bat -pp'; fi

# k8s aliases
alias k='kubectl'
alias kns='kubectl config set-context --current --namespace'
alias kuc='kubectl config use-context'
alias kgc='kubectl config get-contexts'

# Numpad keys (bindkey to do the mapping)
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[Ol" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

## bindkey for productivity
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line
# ctrl+arrows
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# ctrl+delete
bindkey "^[[3;5~" kill-word
# ctrl+backspace
bindkey '^H' backward-kill-word

# ls file type colors
[ -r /etc/DIR_COLORS ] && eval `dircolors /etc/DIR_COLORS`

# set KUBECONFIG environment variable with a list of all kubeconfig yaml files in the ~/.kube directory
export KUBECONFIG=$(echo $(find ~/.kube -regextype posix-extended -regex '.*config\..+\.(yml|yaml)') | sed 's/[[:space:]]/:/g')

# Add $HOME/bin to the PATH variable
path+=$HOME/bin

# set Vim as default editor for gh
export EDITOR=nvim

## powerline10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
