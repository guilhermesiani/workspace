" Needs a tmux installed
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
        tmux attach -t default || tmux new -s default
fi

export TERM=screen-256color
