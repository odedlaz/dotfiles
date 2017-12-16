if not ps -ef | grep "[s]sh-agent -s" > /dev/null ^&1
   ssh-agent -s > /dev/null ^&1
   for pubkey in $HOME/.ssh/*.pub
      set privatekey (echo $pubkey | awk -F '.pub' '{print $1}')
      ssh-add $privatekey ^ /dev/null
   end
end