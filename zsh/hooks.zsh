typeset -A SPACE_PATHS
SPACE_PATHS=(
    minicompiler ~/programming_projects/minicompiler
    dotfiles ~/dotfiles
)

# Run the spaces stuff when switching to a dir
chpwd() {
    unalias dn 2>/dev/null
    unset SPACE_ROOT
    
    for f in "$ZSHRC_DIR/spaces/"*.zsh; do
        project=$(basename "$f" .zsh)
        if [[ "$(pwd)" == *"$project"* ]]; then
            SPACE_ROOT="${$(pwd)%%$project*}$project"
            source "$f"
            break
        fi
    done
}

fe() {
    local file=$(fzf --preview 'cat {}')
    [[ -n "$file" ]] && $EDITOR "$file"
}

fse() {
    local file=$(find "$SPACE_ROOT" -type f | fzf --preview 'cat {}')
    [[ -n "$file" ]] && $EDITOR "$file"
}

fem() {
    nvim -O $(fzf -m)      
}

fsf() {
    find "$SPACE_ROOT" -type f | fzf --preview 'cat {}'
}

fsc() {
    local file=$(find "$SPACE_ROOT" -type f | fzf --preview 'cat {}')
    [[ -n "$file" ]] && cat "$file"
}

h() {
    echo "=== Spaces ==="
    for space in ${(k)SPACE_PATHS}; do
        local marker=""
        [[ "${SPACE_PATHS[$space]}" == "$SPACE_ROOT" ]] && marker=" ←"
        echo "  $space$marker"
    done
    
    echo ""
    echo "=== General ==="
    echo "  fe      fuzzy edit from here"
    echo "  fse     fuzzy edit from space root"
    echo "  fem     fuzzy edit multiple from here"
    echo "  jsr     jump to space root"
    echo "  fsf     fuzzy find in space"
    echo "  fsc     fuzzy find in space then cat"
    echo "  h       show this"
    
    if [[ -n "$SPACE_HELP" ]]; then
        echo ""
        echo "=== $(basename $SPACE_ROOT) ==="
        echo "$SPACE_HELP"
    fi
}

chpwd
