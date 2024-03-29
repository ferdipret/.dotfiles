source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "LFabre/zsh-git-prompt-enhanced"
zplug "akash329d/zsh-alias-finder"
zplug "romkatv/powerlevel10k", as:theme, depth:1

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load

alias la="ls -al"
alias v="nvim"
alias vim="nvim"
export GIT_TERMINAL_PROMPT=true

ar_auth() {
	npm_config_registry=https://registry.npmjs.org npx google-artifactregistry-auth
  unset npm_config_registry
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export EDITOR=nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add IEx history
export ERL_AFLAGS="-kernel shell_history enabled"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# pnpm
export PNPM_HOME="/Users/Ferdinand.Pretorius/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
path+=("/usr/local/opt/llvm/bin")
path+=("/opt/homebrew/bin")
path+=("/user/local/bin/python3")
path+=("$HOME/.config/emacs/bin")

. "$HOME/.asdf/asdf.sh"

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

export PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/Ferdinand.Pretorius/gc-sdk/path.zsh.inc' ]; then . '/Users/Ferdinand.Pretorius/gc-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/Ferdinand.Pretorius/gc-sdk/completion.zsh.inc' ]; then . '/Users/Ferdinand.Pretorius/gc-sdk/completion.zsh.inc'; fi
