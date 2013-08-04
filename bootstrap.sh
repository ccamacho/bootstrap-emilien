#!/bin/bash
#
# Bootstrap script (Inspired by Chmouel)
#
# Use : sudo apt-get -y install curl  && curl -L http://goo.gl/JHWf1U | sh
#

export DEBIAN_FRONTEND=noninteractive
set -e

sudo apt-get -y install locales vim screen git-core zsh-beta
sudo locale-gen en_US.UTF-8

sudo sed -i '/^%sudo/ { s/ALL$/NOPASSWD:ALL/ }' /etc/sudoers

sudo update-alternatives --set editor /usr/bin/vim.basic

cd $HOME
mkdir -p git
cd git

sudo chsh -s /bin/zsh $USER
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
git clone https://github.com/sontek/dotfiles/
cd dotfiles && ./install.sh
cd ..

git clone https://github.com/EmilienM/emilien-config

for f in gitconfig screenrc vimrc zshrc;do
    rm -f ~/.${f}
    ln -fs git/emilien-config/rc-config/${f} ~/.${f}
done

mkdir -p ~/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYt5FqMTz91Mbctj7wWg2tAkzwMDwDFtvw0l/6SGPqV+w84SxM1sRmCm1iGdjCk7Rhy3493yRMrA6RT02yTQnXyXG5xC9stspWku9GPNNXyg83SvC/iz53E5SWwYQISmgBK+dYNwzjiN8C8ohxmT8elV1ElckgGvzTOk80KygUzpf+KOfezQcSXZWxBbYsK/8FamPBoWGLCByv+zVX+dSjNgraqdGZDlXns+NiZAeEHeBwKTufFpN//1xm4lG+ah4g5oqaXNf1M7LApPSSm4r5VdFp0+S5SbcPocu+ztwttstnLI0fgJ5XUyqUJM0fZbaj1qkhFeG7bCi/75XIjnkp emilien@enovance">>~/.ssh/auhorized_key

source ~/.zshrc
