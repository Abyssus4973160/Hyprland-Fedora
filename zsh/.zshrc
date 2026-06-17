export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="afowler"
ENABLE_CORRECTION="true"
setopt PROMPT_SUBST


# PLUGINS
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-history-substring-search
)


source $ZSH/oh-my-zsh.sh

# PROMPT CONFIGURATION

function dir_icon {
	if [[ "$PWD" == "$HOME" ]]; then
		echo "%B%F{black}%f%b"
	else
		echo "%B%F{cyan}%f%b"
	fi
}

function parse_git_branch {
	local branch
	branch=$(git symbolic-ref --short HEAD 2> /dev/null)
	if [[ -n "$branch" ]]; then
		# Muestra el ícono  solo si hay una rama
		echo "%F{yellow}  $branch%f"
	fi
}

PROMPT=' %F{36}%~%f$(parse_git_branch) %F{white}>%f ' 

# export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fnm
FNM_PATH="/home/abyssus00/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

fastfetch
export PATH="$HOME/.local/bin:$PATH"
