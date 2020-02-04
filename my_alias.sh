
# git
alias gdiffall='git difftool --tool=vimdiff --no-prompt'
alias gdiff='xargs -iFILE git difftool --tool=vimdiff --no-prompt FILE'
alias mod="git status -s | awk '{if (\$1 ~ \"M\") print \$2}'"
alias stat="git status -s | awk '{if (\$1 != \"??\") print \$2}'"
alias glog="git log --all --decorate --oneline --graph -30"
alias gl="git log --pretty=format:'%C(auto)%h%d%C(reset) \"%s\" %C(yellow)%ar by %an' --graph --all -30"
alias sep="echo '#########################################################################################################'"
alias g="sep; git branch -v; sep; git status; gl"

# misc
alias psmy='echo "this terminal: `tty`"; ps uxf'
alias vm='ssh benoit@10.113.194.18'
