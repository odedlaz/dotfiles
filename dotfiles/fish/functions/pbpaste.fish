function pbpaste  --description "Paste data from the Clipboard"
   if is_wsl
      powershell.exe -nologo -noprofile -noninteractive 'Get-Clipboard'
   else
      xclip -selection clipboard -o
   end
end
