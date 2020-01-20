function is_wsl --description "Check if running inside WSL"
   grep 'Microsoft|WSL' /proc/version > /dev/null
   return $status
end

function wsl_version --description "get WSL version"
   wsl.exe -l -v > /dev/null
   if test $status -eq 0
      echo 2
   else
      echo 1
   end
end
