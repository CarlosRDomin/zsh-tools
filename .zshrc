# Save a reference to this folder for later use
MYZSH_DIR="$(dirname $0)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# compinstall settings
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename "${HOME}/.zshrc"

# History settings
DEFAULT_USER=$(whoami)
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=3000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n ${SSH_CONNECTION} ]]; then
  export EDITOR='nano'
else
  export EDITOR='atom'
fi
export KUBE_EDITOR='nano'

# Load custom functions
fpath=("${MYZSH_DIR}/.zsh_functions" ${fpath})
autoload -Uz ${fpath[1]}/*(.:t)

# Load custom aliases
source "${MYZSH_DIR}/.aliases"

# Load custom secrets (tokens, etc.)
[ -f "${MYZSH_DIR}/.secrets" ] && source "${MYZSH_DIR}/.secrets"  # NOT COMMITTED :)

# Load completions installed through homebrew
fpath=("$(brew --prefix)/share/zsh/site-functions" "$(brew --prefix)/share/zsh-completions" ${fpath})

# Load oh-my-zsh
source "${MYZSH_DIR}/.oh-my-zsh"

# powerlevel10k theme settings
source "${MYZSH_DIR}/.p10k.zsh"

# Fuzzy auto-complete -> Ctrl-R FTW :)
[ -f "${HOME}/.fzf.zsh" ] && source "${HOME}/.fzf.zsh"

# Syntax highlighting (colors)
[ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# iterm2 integration
[ -f "${HOME}/.iterm2_shell_integration.zsh" ] && source "${HOME}/.iterm2_shell_integration.zsh"

# Kubectl autocomplete
type kubectl >/dev/null && source <(kubectl completion zsh)

# Add common folders to PATH
export PATH="${PATH}:${HOME}/.krew/bin:${HOME}/go/bin"

# Setup kubectl neat diff
type kubectl-neat-diff >/dev/null && export KUBECTL_EXTERNAL_DIFF=kubectl-neat-diff
