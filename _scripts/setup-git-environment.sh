#!/bin/bash

echo "Setting up Git and SSH environment..."

# Setup SSH agent persistence
echo "Setting up SSH agent persistence..."

# Create systemd user directory
mkdir -p ~/.config/systemd/user/

# Create ssh-agent service
cat << 'EOF' > ~/.config/systemd/user/ssh-agent.service
[Unit]
Description=SSH key agent

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK

[Install]
WantedBy=default.target
EOF

# Start and enable the service
systemctl --user enable ssh-agent
systemctl --user start ssh-agent

# Add to shell config
if ! grep -q "SSH_AUTH_SOCK" ~/.bashrc; then
    echo 'export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"' >> ~/.bashrc
fi

# Set up current session
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

# Configure SSH
echo "Configuring SSH for GitHub..."
cat << EOF > ~/.ssh/config
Host github.com
    AddKeysToAgent yes
    IdentityFile ~/.ssh/id_ed25519
EOF

# Set proper permissions
chmod 600 ~/.ssh/config

# Add SSH key
ssh-add ~/.ssh/id_ed25519

# Install keychain
echo "Installing and configuring keychain..."
sudo apt-get install -y keychain

# Add keychain to shell config if not already present
if ! grep -q "keychain.*ssh.*id_ed25519" ~/.bashrc; then
    echo 'eval `keychain --eval --agents ssh id_ed25519`' >> ~/.bashrc
fi

# Configure Git
echo "Configuring Git..."
read -p "Enter your Git username: " git_username
read -p "Enter your Git email: " git_email

git config --global user.name "$git_username"
git config --global user.email "$git_email"
git config --global init.defaultBranch main
git config --global core.editor "vim"
git config --global pull.rebase false

# Verify GitHub CLI installation
if ! command -v gh &> /dev/null; then
    echo "GitHub CLI not found. Installing..."
    type -p curl >/dev/null || sudo apt install curl -y
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
fi

# Ensure GitHub CLI is authenticated
echo "Authenticating with GitHub CLI..."
gh auth status || gh auth login

echo "Git and SSH environment setup completed!" 