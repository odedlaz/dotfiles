SCRIPTS_DIR="$HOME/Dev/scripts"

# remove ag alias for silver searcher
unalias ag &> /dev/null

alias vi="nvim"
alias vim="nvim"
alias atom="echo use vim instead\!"
alias atom\!="/usr/bin/atom"
alias wget="axel -a -n 5"
alias wget\!="/usr/bin/wget"
alias pc="python3 ${SCRIPTS_DIR}/passgen.py"
alias fuck='sudo $(fc -ln -1)'
alias fuckhome='sudo -H $(fc -ln -1)'
alias pbcopy='xclip -selection c'
alias pbpaste='xclip -selection clipboard -o'
alias readme='pandoc README.md | lynx -stdin'
alias gpom='git push origin master'
alias gpom\!='git push -f origin master'
alias pingg="ping google.com"
alias unpair="sudo bash ${SCRIPTS_DIR}/unpair.sh"
alias pair="sudo bash ${SCRIPTS_DIR}/pair.sh"
alias rmpyc="find . -name \"*.pyc\" | xargs rm &> /dev/null"
