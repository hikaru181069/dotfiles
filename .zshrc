# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias ls="eza --icons"
alias ll="eza -lah --icons"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
source "$(brew --prefix nvm)/nvm.sh"

source $(brew --prefix powerlevel10k)/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/Library/Python/3.9/bin:$PATH"

eval "$(zoxide init zsh)"

# tree を色付きで見やすく
alias tree="tree -C"

# よく使う tree 例
alias tree2="tree -C -L 2"
alias tree3="tree -C -L 3"
alias treei="tree -C -I 'node_modules|.git|dist|build'"

# eza の tree 表示
alias lt="eza --tree --icons --level=2"
alias lt3="eza --tree --icons --level=3"
alias lta="eza --tree --icons --level=2 -a"

. "$HOME/.local/bin/env"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# python環境構築
mkpy() {
  mkdir -p "$1" &&
  cd "$1" &&
  python -m venv .venv &&
  source .venv/bin/activate &&
  python -m pip install debugpy ruff
}
