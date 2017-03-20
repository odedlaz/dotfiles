if not ps -ef | grep "[s]sh-agent -s" > /dev/null ^&1
   ssh-agent -s > /dev/null ^&1
   ssh-add $HOME/.ssh/github_rsa ^ /dev/null
   ssh-add $HOME/.ssh/digitalocean_rsa ^ /dev/null
end
