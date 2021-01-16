#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [ -d "$HOME"/.config/bash ]; then
    for FILE in "$HOME"/.config/bash/*; do
        . $FILE
    done
fi
