function pbcopy --description "Copy data from STDIN to the clipboard"
   if is_wsl and test (wsl_version) -eq 1
      strstrip | clip.exe
   else
      strstrip | xclip -selection c
   end
end

function cmdpbcopy --description "Copy data from STDIN to the clipboard"
   history -n 1 | pbcopy
end

