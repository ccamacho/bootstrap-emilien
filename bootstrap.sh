#!/bin/bash
sudo dnf -y update
sudo dnf -y install git ansible
mkdir -p .ssh
git clone root@git.macchi.pro:/srv/git/backup.git /tmp/backup
cp /tmp/backup/ssh/* ~/.ssh/
rm -rf /tmp/backup
git clone https://github.com/EmilienM/bootstrap-emilien /tmp/bootstrap-emilien
sudo mv /tmp/bootstrap-emilien /etc/ansible/roles/
ansible-playbook /etc/ansible/roles/bootstrap-emilien/bootstrap.yaml --user=emilien --ask-sudo-pass
