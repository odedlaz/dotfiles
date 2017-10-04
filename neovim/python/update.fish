#!/usr/bin/env sh

pip install wheel
pip install --upgrade -r requirements.txt

# http://stackoverflow.com/a/3452888/353337
pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U
