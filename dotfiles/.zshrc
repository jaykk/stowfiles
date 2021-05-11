# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

bindkey -v

aws_prof='$AWS_PROFILE'
git_info='$(git_prompt_info)'
alias bat="bat --wrap never"
alias k=kubectl
alias be="bundle exec"
alias sm="bundle exec stack_master"
bindkey '^q' push-line-or-edit
#bindkey -M viins 'aa' vi-cmd-mode
autoload -U compinit
compinit
autoload bashcompinit && bashcompinit
complete -C '/usr/local/aws-cli/aws_completer' aws

export EDITOR=emacsclient
#set -o vi
export KEYTIMEOUT=40
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme
# eval "$(starship init zsh)"
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_SPACE
setopt share_history
export PATH=${HOME}"/Library/Application Support/Coursier/bin:${HOME}/.emacs.d/bin/:$HOME/bin:$HOME/.jenv/bin:/usr/local/bin:$PATH"
export ARTIFACTORY_USERNAME=$(cat ~/.artifactory_user)
export ARTIFACTORY_API_KEY=$(cat ~/.artifactory_key)
export BROWSER=browser
eval "$(jenv init -)"
eval "$(pyenv init -)"
eval "$(rbenv init -)"

vim() {
  emacsclient $1 &
}
vi() {
  emacsclient $1 &
}
vterm_printf(){
    if [ -n "$TMUX" ]; then
        # Tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}
#bindkey "\e[3~" delete-char

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f ${HOME}'/google-cloud-sdk/path.zsh.inc' ]; then . ${HOME}'/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f ${HOME}'/google-cloud-sdk/completion.zsh.inc' ]; then . ${HOME}'/google-cloud-sdk/completion.zsh.inc'; fi
# BEGIN ZDI
export DOCKER_FOR_MAC_ENABLED=true
source ${HOME}/Code/zendesk/zdi/dockmaster/zdi.sh
# END ZDI
#ZVM_VI_ESCAPE_BINDKEY=jk
#source ~/.zsh-vi-mode/zsh-vi-mode.plugin.zsh
source ~/Code/fzf-tab/fzf-tab.plugin.zsh
source ~/Code/kubectl_config/dotfiles/kubectl_stuff.bash
