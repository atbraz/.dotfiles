# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/squashfs-root/usr/bin" ] ; then
    PATH="$PATH:$HOME/squashfs-root/usr/bin"
fi

if [ -d "/opt/nvim-linux64" ] ; then
  export PATH="$PATH:/opt/nvim-linux64/bin"
  export EDITOR='nvim'
fi

if [ -d "$HOME/.modular" ]; then
  export MODULAR_HOME="$HOME/.modular"
  if [ -d "$HOME/.modular/pkg/packages.modular.com_mojo/bin" ]; then
    export PATH="$PATH:$HOME/.modular/pkg/packages.modular.com_mojo/bin"
  fi
fi

export HOMEBREW_NO_ENV_HINTS=TRUE

if command -v fd > /dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND="fd --type file --color=always"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS="--ansi"
fi

# stow .dotfiles
export DOT="$HOME/.dotfiles"

export HOMEBREW_NO_ENV_HINTS=TRUE

if command -v fd > /dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND="fd --type file --color=always"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS="--ansi"
fi

# stow .dotfiles
export DOT="$HOME/.dotfiles"