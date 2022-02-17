function cdtogitroot --description 'cd to git root directory'
   cd (git rev-parse --show-toplevel)
end
