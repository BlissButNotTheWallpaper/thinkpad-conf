#!/bin/bash
tmux new-window "bash -i -c 'FILE=\$(fdfind . "$HOME" --type file --hidden --max-depth 3 --exclude '**/.cache' --exclude '**/.mozilla' --exclude '**autostart' | fzf --preview \"cat {}\" --height 50%); if [ -n \"\$FILE\" ]; then cd \"\$(dname \"\$FILE\")\"; vim \"\$FILE\"; fi; exec bash'"

