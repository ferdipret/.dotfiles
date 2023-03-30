source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "LFabre/zsh-git-prompt-enhanced"
zplug "laurenkt/zsh-vimto"
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "akash329d/zsh-alias-finder"
zplug "marlonrichert/zsh-autocomplete"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias la="ls -al"
alias v="nvim"
alias vim="nvim"
export GIT_TERMINAL_PROMPT=true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add IEx history
export ERL_AFLAGS="-kernel shell_history enabled"
export PATH="/usr/local/opt/llvm/bin:$PATH"
