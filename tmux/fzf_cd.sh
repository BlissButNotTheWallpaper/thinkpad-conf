#!/bin/bash
tmux new-window "zsh -i -c 'DIR=\$(find ~ -type d | fzf --preview \"ls -l {}\" --height 80%); [ -n \"\$DIR\" ] && cd \"\$DIR\" && exec zsh'"

