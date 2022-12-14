PPS1=$PS1
PS1="\[\e[33m\]\u\[\e[m\]:\[\e[36m\]\w\[\e[m\]\\\$ $(printf %${SHLVL}s|tr \  \()\j)\n  "
expath(){ [[ :$PATH: == *:$1:* ]]||export PATH=$1:$PATH;}
expath ~/.local/bin
expath ~/.cargo/bin
expath ~/.npm-global/bin
expath ./node_modules/.bin
export        EDITOR=hx
export          LESS='FiR --mouse --wheel-lines=3'
export HELIX_RUNTIME=~/.local/share/helix/runtime
export PYTHONSTARTUP=~/.pythonrc
export     NODE_PATH=~/.npm-global/lib/node_modules
alias           grep='grep --color=auto'
alias             ls='ls --color=auto'
alias             la='ls -FXxA'
alias             ll='ls -FXgo'
alias              l='ls -FXx'
alias           tree='tree --dirsfirst'
alias            tre='treest --printer=fancy --rcfile='"'$HOME/.treestrc'"' -CdFjwX'
alias           info='info --vi-keys'
alias             db='gdb -q --args'
alias             py='python3'
alias              s='git status'
alias          reset='stty sane -ixon'
alias         xargsa='xargs -d\\n -a'
alias         xclipp='xclip -sel c'
bind -x       '"\ez":fg&>/dev/null'
bind -x       '"\eZ":fg -&>/dev/null'
bind -x       '"\eq":tre'
bind -x       '"\ee":t=`mktemp --suffix=.bash`;echo "$READLINE_LINE">"$t";$EDITOR $t;READLINE_LINE=`cat $t`;rm $t;READLINE_POINT=${#READLINE_LINE}' # for some unknown reason, this is not a useless use of cat
bind -x       '"\ey":printf %s "$READLINE_LINE" | xclip -sel c'
set -b
[ -z "$LS_COLORS" ] && eval "$($(command -v dircolors) -b)"
[ -n "$DISPLAY" ] && command -v xrdb >/dev/null && xrdb -merge ~/.Xdefaults
command_not_found_handle()(echo "$1": command not found>/dev/tty;exit 127) # TODO: make it useful
which_include()(find `gcc -v -E -</dev/null 2>&1|awk '/^#include </{f=1;next}/^End/{f=0}f'` -name "$1")
fwhich()(file "$(which "$@")")
unset which # fedora
reset
