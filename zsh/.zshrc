# source $HOME/dotfiles/zsh/antigen/antigen.zsh

# antigen use oh-my-zsh

#     # virtualenvwrapper
#     # vi-mode
# antigen bundles <<EOBUNDLES
#     git
#     extract
#     brew
#     pip
#     python
#     github
#     command-not-found
#     history
#     zsh-users/zsh-syntax-highlighting
#     sindresorhus/pure
#     zsh-users/zsh-history-substring-search
#     bobthecow/git-flow-completion
# EOBUNDLES

# antigen apply

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

source $HOME/dotfiles/zsh/.zsh_aliases

export EDITOR='vim'

export PATH="/usr/local/bin:$PATH"

# Fix backspace in vi mode
# bindkey "^?" backward-delete-char

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

source $HOME/dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-hightlighting.zsh
