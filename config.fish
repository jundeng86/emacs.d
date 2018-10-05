set -gx PATH /home/jd/anaconda3/bin $PATH
set -gx PATH /usr/local/cuda-9.0/bin $PATH
set -gx PATH /home/jd/.local/bin $PATH
set -gx PATH /home/jd/bin $PATH
#set -gx MANPATH /usr/local/texlive/2016/texmf/doc/man $MANPATH
#set -gx INFOPATH /usr/local/texlive/2016/texmf/doc/info $INFOPATH
set -gx LD_LIBRARY_PATH /usr/local/cuda-9.0/lib64:/usr/local/cuda-9.0/extras/CUPTI/lib64 $LD_LIBRARY_PATH
set -gx CUDA_HOME /usr/local/cuda-9.0
set fish_greeting ""

alias e="emacsclient -t"
alias ec="emacsclient -c"
alias en="emacsclient -n"

alias ssh="TERM=xterm-256color ssh"

# set -gx EDITOR "emacsclient -t"
# set -gx VISUAL "emacsclient -n -a emacs"

set -x  EMACS "$HOME/.spacemacs"

alias open="xdg-open"

#alias clearc="sync; echo 3 | sudo tee /proc/sys/vm/drop_caches"# clear cached memory 
# some more ls aliases
alias ll='ls -alhG'
alias la='ls -A'
alias l='ls -CFlh'
alias ls='ls --group-directories-first --color'
alias fw="find -name '*.wav' | wc -l" # show the number of wav audio files
alias lsd="ls -d */"            # list only folders

alias df='df -h -x tmpfs'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias woo='fortune'

alias md="sshfs jdeng@compute2.local:/home/jdeng/ ~/mnt/comt2/"  
alias mw="sshfs jdeng@lxlogin2.lrz.de:/naslx/projects/t8433/di29buq/jdeng ~/work/"
alias pmd="sshfs -p 11224 jdeng@site-main.audeering.com:/home/jdeng/mount ~/mnt/comt2"

alias mdata="bash ~/cifs/mount-homes"
alias umdata="bash ~/cifs/umount-homes"

alias comt2="ssh -Y jdeng@compute2"
alias comt1="ssh -Y jdeng@192.168.88.120"

# alias pcomt1="ssh -p 11224 jdeng@site-main.audeering.com"
alias sshnotebook="ssh -N -f -L localhost:8888:localhost:8888 jdeng@compute2.local"

# alias enc="encfs /usr/data/data_code/ /home/jdeng/data_code/"

bind -k up 'history --merge ; up-or-search'


# emacs ansi-term support
# if test -n "$EMACS"
#  set -x TERM eterm-color
# end

# true color
set -x TERM xterm-24bit

set -x TERMINFO /usr/share/emacs/26.1/etc/
eval (dircolors /home/jd/.dir_colors/dircolors | head -n 1 | sed 's/^LS_COLORS=/set -x LS_COLORS /;s/;$//')

# this function may be required
function fish_title
  true
end
