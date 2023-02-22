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
tmux split-window -v
sudo apt-get install -y rustc cargo
cargo install bore-cli
bore local 5000 --to bore.pub
tmux select-pane -t 0
./play.sh
```
