if test (uname) = "Darwin"
   exit 0
end

function pbpaste  --description "Paste data from the Clipboard"
   if is_wsl and test (wsl_version) -eq 1
      powershell.exe -nologo -noprofile -noninteractive 'Get-Clipboard'
   else
      xclip -selection clipboard -o
   end
end
