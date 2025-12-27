# source building
mkdir ~/source
mkdir ~/dev
mkdir ~/bin

# make
sudo apt install make
sudo apt install curl

# git
sudo apt install git
sudo apt install git-lfs

# vim
sudo apt install vim

# tmux
sudo apt install tmux

# fzf
sudo apt install fzf

# ag
sudo apt install silversearcher-ag

# yq
wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq
chmod +x /usr/bin/yq

# global protect
sudo add-apt-repository ppa:yuezk/globalprotect-openconnect
sudo apt-get install globalprotect-openconnect

# npm
sudo apt install npm

# docker
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# docker group
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
