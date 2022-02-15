function jkill --description "SIGKILL all jobs in current subshell"
   jobs -p | cut -d" " -f 1 | xargs kill -9
end
