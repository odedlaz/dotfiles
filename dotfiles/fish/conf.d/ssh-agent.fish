set agent_environ /tmp/.ssh-agent/environment

if not test -f $agent_environ
   pkill ssh-agent
end

if not pgrep ssh-agent > /dev/null
   rm -rf (dirname $agent_environ)
end

if mkdir (dirname $agent_environ) ^ /dev/null
   eval (ssh-agent -c | grep '^setenv' | tee $agent_environ)
   chmod 600 $agent_environ

   for pubkey in (find $HOME/.ssh -type f -name "*.pub")
      set private_key (echo $pubkey | sed 's/.pub//')
      ssh-add $private_key ^ /dev/null
   end
end

source $agent_environ




