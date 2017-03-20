#!/usr/bin/env fish

function rmext --description "Remove all files in directory that end with extension"
   find . -name "*.$argv" | xargs rm > /dev/null ^&1
end

function rmpyc --description "Remove all python bytecode files"
   rmext "pyc"
end

