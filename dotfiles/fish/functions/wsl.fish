function is_wsl --description "Check if running inside WSL"
   grep 'Microsoft|WSL' /proc/version > /dev/null
   return $status
end
