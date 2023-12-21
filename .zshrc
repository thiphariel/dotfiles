# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
if [[ $(uname) == "Darwin" ]]; then
  ZSH_THEME="robbyrussell"
else
  ZSH_THEME="powerlevel10k/powerlevel10k"
fi

# Syntax highlighting theme
source $HOME/.config/zsh/catppuccin_mocha-syntax-highlighting.zsh

# Bat theme
export BAT_THEME="catppuccin-mocha"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

if [[ $(uname) == "Linux" ]]; then
  # Activate python3 venv
  source ~/.venv/bin/activate
  # fnm
  export PATH="$HOME/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# fnm
eval "$(fnm env --use-on-cd)"

# Rust
source "$HOME/.cargo/env"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
fi

# Basic aliases
alias ec="$EDITOR $HOME/.zshrc"
alias sc="source $HOME/.zshrc"
alias et="$EDITOR $HOME/.config/tmux/tmux.conf"
alias vim=nvim
alias python=python3
alias g=git
alias lg=lazygit

# Dotfiles
alias dfl="g --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Private aliases
source $HOME/.personal.aliases
source $HOME/.ssh.aliases

if [[ $(uname) == "Darwin" ]]; then
  source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
