#!/bin/bash
tmux new-window "bash -i -c 'DIR=\$(fdfind . "$HOME" --type directory --hidden --max-depth 3 --exclude '**/.cache' --exclude '**/.mozilla' --exclude '**autostart'| fzf --preview \"ls -l {}\" --height 50%); [ -n \"\$DIR\" ] && cd \"\$DIR\" && exec bash'"

