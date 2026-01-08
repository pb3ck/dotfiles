# ~/.config/zsh/.zshrc

# Add ~/.local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# Initialize rokit
. "$HOME/.rokit/env"

# Setup completion system
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"
zstyle ':completion:*' menu select
zmodload zsh/complist

# Enable vi mode
bindkey -v
export KEYTIMEOUT=1

# History settings
unset HISTFILE

# Auto-cd
setopt auto_cd
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Basic prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' [%b]'
setopt PROMPT_SUBST
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f${vcs_info_msg_0_}$ '

# Enable syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Initialize NVM for Node.js version management
source /usr/share/nvm/init-nvm.sh
