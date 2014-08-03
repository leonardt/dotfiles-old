source $HOME/dotfiles/zsh/antigen/antigen.zsh

antigen bundle git
antigen bundle brew
antigen bundle pip
antigen bundle python
antigen bundle virtualenvwrapper
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-history-substring-search

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
