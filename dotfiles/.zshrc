aws_prof='$AWS_PROFILE'
git_info='$(git_prompt_info)'
alias bat="bat --wrap never"
alias k=kubectl
#alias vim=nvim
bindkey '^q' push-line-or-edit

set -o vi
export KEYTIMEOUT=1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
export PATH="$HOME/bin:$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
eval "$(pyenv init -)"
