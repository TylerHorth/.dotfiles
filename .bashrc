#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

xset -b # disable bell

set -o vi

setxkbmap -option ctrl:nocaps       # Make Caps Lock a Control key
ps cax | grep xcape > /dev/null
if [ $? -eq 0 ]; then
	pkill xcape
fi
xcape -e 'Control_L=Escape'

PATH="${PATH}:/home/tdphorth/.gem/ruby/2.2.0/bin"

alias copy='rsync -av --exclude=".*" tdphorth@linux.student.cs.uwaterloo.ca:~/cs246 ~/Documents'
alias update='rsync -av --exclude=".*" ~/Documents/cs246 tdphorth@linux.student.cs.uwaterloo.ca:~'
alias connect='ssh -Y tdphorth@linux.student.cs.uwaterloo.ca'
alias cs='cd ~/Documents/cs246/1159/'
alias open='gnome-open'
alias t='~/Documents/cs246/1159/runSuite'
alias ei3='vim ~/.config/i3/config'
alias estatus='vim ~/.i3status.conf'
alias ebash='vim ~/.bashrc'
