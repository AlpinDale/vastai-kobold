#!/bin/bash
if ! dpkg -s nvidia-driver >/dev/null 2>&1; then
  echo "Installing Nvidia drivers..."
  apt-get update
  Apt-get install -y nvidia-driver
fi
if ! dpkg -s cuda >/dev/null 2>&1; then
  echo "Installing CUDA..."
  apt-get install -y nvidia-cuda-dev nvidia-cuda-toolkit
fi
if ! dpkg -s git >/dev/null 2>&1; then
  echo "Installing Git..."
  apt-get install -y git
fi
if ! dpkg -s tmux >/dev/null 2>&1; then
  echo "Installing Tmux..."
  apt-get install -y tmux
fi
mkdir AI && cd AI
git clone https://github.com/henk717/KoboldAI
cd KoboldAI
tmux new-session -d -s asession
tmux send-keys 'tmux split-window -v' C-m
tmux send-keys -t 1 'apt-get install -y rustc cargo' C-m
tmux send-keys -t 1 'cargo install bore-cli' C-m
tmux send-keys -t 1 'bore local 5000 --to bore.pub' C-m
tmux send-keys -t 0 './play.sh' C-m
