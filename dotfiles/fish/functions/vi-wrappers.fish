function vifd --argument text
   set path (fd -t f "$text" | fzf)
   if test -n "$path"
      vi "$path"
   end
end

function vilocate --argument text
   set path (locate "$text" | fzf)
   if test -n "$path"
      vi "$path"
   end
end

function virg --argument text
   set match (rg "$text" --vimgrep --no-messages | fzf)

   if test -z "$match"
      return 1
   end

   set cursor_cmd (echo "$match" | awk -F ':' '{ print "+normal "$2"G"$3"|" }')
   set path (echo "$match" | awk -F ':' '{ print $1 }')
   nvim "$cursor_cmd" $path
end

function viwhich --argument binary
   vi (which $binary)
end
