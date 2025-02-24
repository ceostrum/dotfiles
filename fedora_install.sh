# source building
mkdir ~/source
mkdir ~/dev
mkdir ~/bin
sudo dnf group install "Development Tools" -y
sudo dnf install automake -y

# solarized
if [ ! -d "$HOME/.solarized" ]; then
    mkdir -p $HOME/.solarized
    cd $HOME/.solarized
    git clone https://github.com/seebi/dircolors-solarized.git
    eval `dircolors ~/.solarized/dircolors-solarized/dircolors.ansi-dark`
    ln -s ~/.solarized/dircolors-solarized/dircolors.256dark ~/.dir_colors

    git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
    cd gnome-terminal-colors-solarized
    ./install.sh -s dark_alternative
fi

# dotfiles
cd
git clone git://github.com/ceostrum/dotfiles.git ~/dev/dotfiles
cp ~/dev/dotfiles/.* ~/
ln -s ~/dev/dotfiles/.vimrc ~/.vimrc

# tmux
sudo dnf install tmux -y

# ag
sudo dnf install the_silver_searcher -y

# vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code -y

# pyenv
sudo dnf install bzip2-devel libffi-devel readline-devel sqlite-devel tk-devel -y
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# goenv
#git clone https://github.com/syndbg/goenv.git ~/.goenv

# yq
wget -qO $HOME/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64
chmod 755 $HOME/bin/yq

# docker
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
