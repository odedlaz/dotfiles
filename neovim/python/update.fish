#!/usr/bin/env fish

set DIR (dirname (readlink -f (status -f)))
pip install --upgrade -r $DIR/requirements.txt

# http://stackoverflow.com/a/3452888/353337
pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U
