function fz --argument text
   set pattern '(?P<rank>\d+(\.\d+)?)\s+(?P<path>.+)'
   if test -n "$text"
      set dst (z | rg -i $text | sort -hr | rg $pattern -r '$path' | fzf)
   else
      set dst (z | rg $pattern -r '$path' | fzf)
   end

   if test -n "$dst"
      cd $dst
   end
end
