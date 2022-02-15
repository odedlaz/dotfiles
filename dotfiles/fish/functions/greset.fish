function greset --argument branch
   if test -z $branch
      set branch (__git_branch)
   end

   echo "fetching branch: $branch"
   git fetch origin $branch

   echo "checking out branch: $branch"
   git checkout $branch

   echo "resetting branch: $branch..."
   git reset --hard origin/$branch

   echo "cleaning directory to clean slate..."
   git clean --force -d (git rev-parse --show-toplevel)
end
