# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

fpath=(/usr/local/share/zsh-completions $fpath)
fpath=($HOME/dotfiles/zsh $fpath)

autoload -U promptinit && promptinit
prompt pure

source $HOME/dotfiles/zsh/.zsh_aliases

export EDITOR='vim'

export PATH="/usr/local/bin:$PATH"

# Fix backspace in vi mode
bindkey "^?" backward-delete-char

export RISCV=$HOME/aspire/riscv/riscv
export PATH=$PATH:$RISCV/bin

export FZF_DEFAULT_COMMAND='ag -l -g ""'

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                      -o -type d -print 2> /dev/null | fzf +m) &&
                      cd "$dir"
}

# bindkey '^R' history-incremental-search-backward
source ~/.fzf.zsh

# added by travis gem
[ -f /Users/leonardtruong/.travis/travis.sh ] && source /Users/leonardtruong/.travis/travis.sh

source $HOME/dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/dotfiles/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# Completion
autoload -Uz compinit
compinit

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
