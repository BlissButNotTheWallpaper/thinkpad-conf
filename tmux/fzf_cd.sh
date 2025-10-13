#!/bin/bash
tmux new-window "bash -i -c 'DIR=\$(find ~ -type d | fzf --preview \"ls -l {}\" --height 50%); [ -n \"\$DIR\" ] && cd \"\$DIR\" && exec bash'"

