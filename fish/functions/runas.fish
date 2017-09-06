function rasr --description 'runas root .*'
   /usr/local/bin/runas root:root $argv
end

echo "ok" > /tmp/omfg
