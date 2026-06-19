# ==============================================================================
# 1. CONFIGURACIÓN DE OH-MY-ZSH Y PLUGINS
# ==============================================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="afowler"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh

# ==============================================================================
# 2. OPCIONES DE ZSH Y PATH
# ==============================================================================
setopt PROMPT_SUBST

export PATH="$HOME/.local/bin:$PATH"

# ==============================================================================
# 3. CONFIGURACIÓN DEL PROMPT (TEMA)
# ==============================================================================
function parse_git_branch {
    local branch
    branch=$(git symbolic-ref --short HEAD 2> /dev/null)
    [[ -n "$branch" ]] && echo "%F{yellow}  $branch%f"
}

PROMPT=' %F{36}%~%f$(parse_git_branch) %F{white}>%f ' 

# ==============================================================================
# 4. ENTORNOS Y HERRAMIENTAS (Node, FNM, etc.)
# ==============================================================================
# Administrador de versiones de Node (fnm)
FNM_PATH="$HOME/.local/share/fnm"
if [[ -d "$FNM_PATH" ]]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# ==============================================================================
# 5. BIENVENIDA
# ==============================================================================
# Muestra info del sistema solo si la sesión es interactiva
[[ -o interactive ]] && fastfetch


command -v eza >/dev/null 2>&1 && alias ls="eza --icons --group-directories-first"

extract() {
    if [ -f "$1" ]; then
        local dir_name="${1%.*}"
        if [[ "$1" == *.tar.gz ]] || [[ "$1" == *.tar.bz2 ]]; then
            dir_name="${dir_name%.*}"
        fi

        mkdir -p "$dir_name"

        if [[ "$1" == *.tar.bz2 ]] || [[ "$1" == *.tbz2 ]]; then
            tar xjf "$1" -C "$dir_name"
        elif [[ "$1" == *.tar.gz ]] || [[ "$1" == *.tgz ]]; then
            tar xzf "$1" -C "$dir_name"
        elif [[ "$1" == *.tar ]]; then
            tar xf "$1" -C "$dir_name"
        elif [[ "$1" == *.zip ]]; then
            unzip "$1" -d "$dir_name"
        elif [[ "$1" == *.7z ]]; then
            7z x "$1" -o"$dir_name"
        elif [[ "$1" == *.rar ]]; then
            unrar x "$1" "$dir_name/"
        elif [[ "$1" == *.gz ]]; then
            local out_name="${1%.gz}"
            gunzip -c "$1" > "$dir_name/$out_name"
        elif [[ "$1" == *.bz2 ]]; then
            local out_name="${1%.bz2}"
            bunzip2 -c "$1" > "$dir_name/$out_name"
        else
            echo "'$1' no puede ser extraído mediante extract()"
            rmdir "$dir_name"
            return
        fi

        echo "Contenido extraído con éxito en: %F{cyan}$dir_name/%f"
    else
        echo "'$1' no es un archivo válido"
    fi
}
