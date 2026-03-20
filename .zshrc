ZSH_CONFIG="$ZDOTDIR"

[[ -f "$ZSH_CONFIG/env.zsh" ]] && source "$ZSH_CONFIG/env.zsh"
[[ -f "$ZSH_CONFIG/aliases.zsh" ]] && source "$ZSH_CONFIG/aliases.zsh"
[[ -f "$ZSH_CONFIG/jvm.zsh" ]] && source "$ZSH_CONFIG/jvm.zsh"
[[ -f "$ZSH_CONFIG/nvm.zsh" ]] && source "$ZSH_CONFIG/nvm.zsh"
[[ -f "$ZSH_CONFIG/options.zsh" ]] && source "$ZSH_CONFIG/options.zsh"
[[ -f "$ZSH_CONFIG/prompt.zsh" ]] && source "$ZSH_CONFIG/prompt.zsh"

autoload -Uz compinit && compinit

# plugins last
[[ -f "$ZSH_CONFIG/plugins.zsh" ]] && source "$ZSH_CONFIG/plugins.zsh"

