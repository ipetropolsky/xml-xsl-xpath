#!/usr/bin/env bash
default_url="https://github.com/facebook/create-react-app/pulls"
url=""
if [[ -n "$1" ]]; then
  url=$1
else
  url=${default_url}
fi

wget ${url} -O pulls.html