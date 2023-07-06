#!/bin/bash

# if command -v aws &> /dev/null; then
#     exit
# fi

# curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# unzip awscliv2.zip
# sudo ./aws/install

# Check AWS CLI version
if ! command -v aws &> /dev/null || aws --version 2>&1 | grep -q 'aws-cli/1.'; then
    echo "Installing AWS CLI v2..."

    # AWS CLI v2のインストール
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update

    echo "AWS CLI v2 installed."
else
    echo "AWS CLI v2 is already installed."
fi

# AWS CLI bash-completionの設定
echo "Setting up AWS CLI bash completion..."
if [ -f /usr/local/bin/aws_completer ]; then
    echo "complete -C '/usr/local/bin/aws_completer' aws" >> ~/.bashrc
    source ~/.bashrc
    echo "AWS CLI bash completion configured."
else
    echo "Unable to find AWS CLI completer script. Bash completion not configured."
fi
