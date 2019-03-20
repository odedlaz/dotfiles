function cdfd --argument text
   set path (fd $text | fzf)
   if test -z "$path"
      return 0
   end
   if test -f "$path"
      set path (dirname $path)
   end

   cd "$path"; or return 1
end

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

function cdlocate --argument text
   set path (locate "$text" | fzf)
   cdto "$path"
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

function cdto --argument path
   if test -z $path
      return 1
   end

   if test -L $path
      set path (readlink -f $path)
   end

   if test -f $path
      set path (dirname $path)
   end

   cd $path
end


function cdrg --argument text
   set match (rg "$text" --vimgrep --no-messages | fzf)

   if test -z "$match"
      return 1
   end

   set cursor_cmd (echo "$match" | awk -F ':' '{ print "+normal "$2"G"$3"|" }')
   set path (echo "$match" | awk -F ':' '{ print $1 }')
   if test -z "$path"
      return 0
   end
   if test -f "$path"
      set path (dirname $path)
   end

   cd "$path"; or return 1
end
