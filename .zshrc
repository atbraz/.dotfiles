# ~/.zshrc: executed by zsh for interactive shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
# See zshoptions(1) for more options
HISTCONTROL=ignoredups

# Append to the history file, don't overwrite it
setopt APPEND_HISTORY

# For setting history length
HISTSIZE=1000
SAVEHIST=2000

# Uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

# aliases
alias clip="clip.exe"
alias code="code-insiders"
alias v="nvim"
alias v.="nvim ."
alias sva="source .venv/bin/activate"
alias sz="source $HOME/.zshrc"
alias sp="source $HOME/.zprofile"
alias cat="bat"
alias z.="z .."
alias z-="z -"

# functions

## install and stow
qpushd() {
  pushd "$1" > /dev/null
}

qpopd() {
  popd > /dev/null
}

function install_and_add_to_stow_setup() {
    local cmd="$*"

    if [ -z "$cmd" ]; then
        echo "No command provided."
        return 1
    fi

    eval "$cmd"
    if [ $? -ne 0 ]; then
        echo "Installation command failed: $cmd"
        return 1
    fi

    SETUP_SCRIPT="$DOT/setup.sh"

    if grep -Fxq "$cmd" "$SETUP_SCRIPT"; then
        echo "Command already exists in setup.sh: $cmd"
    else
        echo "\n$cmd" >> "$SETUP_SCRIPT"

        DOTFILES_DIR="$DOT"
        qpushd "$DOTFILES_DIR"

        git add setup.sh

        if ! git diff --cached --quiet; then
            git commit -m "Added new installation command: $cmd"
            git push

            echo "Installation command logged and dotfiles repo synced."
        else
            echo "No changes to commit."
        fi

        qpopd
    fi
}

function sto() {
    install_and_add_to_stow_setup "$@"
}

function restow() {
    qpushd "$DOT"

    stow .
    git add .
    
    if ! git diff --cached --quiet; then
      git commit -m "Updated dotfiles"
      git push
      echo "Synced .dotfiles repo"
    else
      echo "No changes to commit"
    fi

    qpopd
}

## utility functions
function l {
  eza \
    -a \
    -l \
    -F \
    -@ \
    --git \
    --git-repos \
    --group-directories-first \
    --header \
    --icons=always \
    --no-quotes \
    --time-style=relative \
    "$@"
}

# This script was automatically generated by the broot program
# More information can be found in https://github.com/Canop/broot
# This function starts broot and executes the command
# it produces, if any.
# It's needed because some shell commands, like `cd`,
# have no useful effect if executed in a subshell.
function br {
    local cmd cmd_file code
    cmd_file=$(mktemp)
    if broot --outcmd "$cmd_file" "$@"; then
        cmd=$(<"$cmd_file")
        command rm -f "$cmd_file"
        eval "$cmd"
    else
        code=$?
        command rm -f "$cmd_file"
        return "$code"
    fi
}

function c {
    code-insiders "$@"
}

function f {
    fd "$@"
}

function g {
    git "$@"
}

# sources
if [ -d "$HOME/.cargo/env" ] ; then
  source "$HOME/.cargo/env"
fi

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/abraz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

zsh_plugins="${ZDOTDIR:-$HOME}/.zsh_plugins"
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  (
  autoload -Uz compinit
  compinit
  )
  (
    source ".antidote/antidote.zsh"
    antidote bundle <${zsh_plugins}.txt >${zsh_plugins}.zsh
  )
fi
source ${zsh_plugins}.zsh

# keychain configuration
eval `keychain --eval --agents ssh id_ed25519`

# evals

if command -v atuin > /dev/null 2>&1; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi

if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if command -v starship > /dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if command -v zoxide > /dev/null 2>&1; then
  eval "$(zoxide init bash)"
fi
