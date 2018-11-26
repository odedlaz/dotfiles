function detach --description "Run process detached from terminal"
   nohup "$argv" </dev/null >/dev/null 2>&1 &
end
