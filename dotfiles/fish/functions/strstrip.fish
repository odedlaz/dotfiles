#!/usr/bin/env fish

function strstrip
   python3 -c 'import sys; print(sys.stdin.read().strip())'
end
