function opdf  --description "open pdf with evince"
   nohup evince $argv[1] 2>&1 ^ /dev/null > /dev/null &
end

