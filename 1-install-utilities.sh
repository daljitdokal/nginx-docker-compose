#!/bin/bash
# Step 1 - Ensure Azure CLI is installed
# To automate out interations with Auzre Clous Platform we'll use the [[https://docs.microsoft.com/en-us/cli/azure/install-azure-cli][Azure CLI]] which provides us with a number of command line tools to interacr with platform.

# #+NAME: Install Azure CLI

# Get packages needed for the install process
sudo apt-get update
echo "Y" | sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg


# Download and install the Microsoft signing key
curl -sL https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null


# Update repository information and install the azure-cli
sudo apt-get update
sudo apt-get install azure-cli

# Add the Azure CLI software repository (skip this step on ARM64 Linux distributions):
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list


# Install GitHub CLI
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo+ apt-get update && sudo apt-get install gh
