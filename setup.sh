```bash
#!/bin/bash
if ! dpkg -s nvidia-driver >/dev/null 2>&1; then
  echo "Installing Nvidia drivers..."
  sudo apt-get update
  sudo apt-get install -y nvidia-driver
fi
if ! dpkg -s cuda >/dev/null 2>&1; then
  echo "Installing CUDA..."
  sudo apt-get install -y nvidia-cuda-dev nvidia-cuda-toolkit
fi
if ! dpkg -s git >/dev/null 2>&1; then
  echo "Installing Git..."
  sudo apt-get install -y git
fi
if ! dpkg -s tmux >/dev/null 2>&1; then
  echo "Installing Tmux..."
  sudo apt-get install -y tmux
fi
mkdir AI && cd AI
git clone https://github.com/henk717/KoboldAI
cd KoboldAI
tmux new-session -d -s asession
tmux send-keys 'tmux split-window -v' C-m
tmux send-keys 'apt-get install -y rustc cargo' C-m
tmux send-keys 'cargo install bore-cli' C-m
tmux send-keys 'bore local 5000 --to bore.pub' C-m
tmux send-keys 'tmux select-pane -t 0' C-m
tmux send-keys './play.sh' C-m
```
