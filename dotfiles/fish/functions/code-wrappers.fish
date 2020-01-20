function coderg --argument text
   set match (rg "$text" --vimgrep --no-messages | fzf)

   if test -z "$match"
      return 1
   end
   code --goto (echo "$match" | rg '^.+:\d+:\d+' -o)
end
