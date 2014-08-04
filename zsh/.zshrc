source $HOME/dotfiles/zsh/antigen/antigen.zsh

antigen bundles <<EOBUNDLES
    git
    brew
    pip
    python
    github
    virtualenvwrapper
    command-not-found
    history
    zsh-users/zsh-syntax-highlighting
    sindresorhus/pure
    zsh-users/zsh-history-substring-search
EOBUNDLES

antigen apply

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

export EDITOR='mvim -v'
source ~/dotfiles/zsh/.fzf.zsh

export PATH="/usr/local/bin:$PATH"
