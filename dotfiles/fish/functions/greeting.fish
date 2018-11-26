 function fish_greeting
   if status --is-interactive
      echo "You're connected to: "(hostname)
   end
 end
