source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "LFabre/zsh-git-prompt-enhanced"
zplug "laurenkt/zsh-vimto"
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

eval "$(starship init zsh)"

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
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# pnpm
export PNPM_HOME="/Users/ferdi/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
path+=("/usr/local/opt/llvm/bin")
path+=("/opt/homebrew/bin")

export PATH
