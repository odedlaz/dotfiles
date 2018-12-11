function pbcopy --description "Copy data from STDIN to the clipboard"
   xclip -selection c
end

function cmdpbcopy --description "Copy data from STDIN to the clipboard"
   history -n 1 | pbcopy
end

