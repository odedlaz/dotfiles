if test (uname) = "Darwin"
  exit 0
end

function pbcopy --description "Copy data from STDIN to the clipboard"
   if is_wsl and test (wsl_version) -eq 1
      strstrip | clip.exe
   else
      strstrip | xclip -selection c
   end
end
