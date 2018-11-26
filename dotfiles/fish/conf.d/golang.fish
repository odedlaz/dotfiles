set -e GOPATH
set -e GOBIN

set -x -U GOPATH $HOME/Dev/go
set -x -U GOBIN $HOME/Dev/go/bin

if test -e $GOPATH
   set PATH $PATH $GOROOT/bin $GOBIN
end
