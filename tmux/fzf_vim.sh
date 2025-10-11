#!/bin/bash
tmux new-window "zsh -i -c 'FILE=\$(find ~ -type f | fzf --preview \"cat {}\" --height 50%); if [ -n \"\$FILE\" ]; then cd \"\$(dirname \"\$FILE\")\"; vim \"\$FILE\"; fi; exec zsh'"

