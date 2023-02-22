#!/bin/bash

# Create directory AI and navigate into it
mkdir AI && cd AI

# Clone the KoboldAI repository
git clone https://github.com/henk717/KoboldAI

# Navigate into the KoboldAI directory
cd KoboldAI

# Install Rust and Cargo
apt-get install -y rustc cargo

# Install bore-cli using Cargo
cargo install bore-cli

# Create a public tunnel for port 5000 using bore.pub
bore local 5000 --to bore.pub | tee bore_output.txt

# Extract the public URL from the output
url=$(grep -o "https://.*" bore_output.txt)

# Print the public URL
echo "Public URL: $url"

# Launch the play.sh script in the background
nohup ./play.sh &

