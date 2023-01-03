#! /bin/bash
function buildMain() {
  echo "build main"
  tmux has-session -t main

  if [ $? -ne 0 ]; then
    tmux new -s main -d -n main
    tmux send-keys -t main 'cd ~' C-m
    tmux new-window -n state -t main:2 -d
    tmux send-keys -t main:2 'btm' C-m
  fi
}

echo 'begin'

# parts: main
if [ $# -eq 0 ]; then
  echo "only main"
  buildMain
else
  for part in $@; do
    echo $part
  done
fi

tmux a