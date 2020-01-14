function pbcopy --description "Copy data from STDIN to the clipboard"
   if is_wsl
      clip.exe
   else
      xclip -selection c
   end
end

function cmdpbcopy --description "Copy data from STDIN to the clipboard"
   history -n 1 | pbcopy
end

