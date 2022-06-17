# Ansible for newbie Devops

## Prerequisite
* OS: Ubuntu 20.04 LTS
* Cloud: GCP
* Install docker & docker-compose
```sh
sudo -s
apt update && apt install -y jq
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version
docker version
```

## Setup
```sh
git clone https://github.com/usrconfig/ansible.git
cd ansible
mkdir tmp
touch tmp/SSH_PRIVATE_KEY
cat <privatekey> > tmp/SSH_PRIVATE_KEY
docker-compose up -d
docker ps
docker exec -it ansible bash
```
Now we are in Ansible container, let's play with it
```sh
cd /home/app/
export ANSIBLE_FORCE_COLOR="true"
export ANSIBLE_CONFIG=./ansible.cfg
# Setup SSH Tunnel to destination nodes
eval "$(ssh-agent -s)"
ssh-add <(cat tmp/SSH_PRIVATE_KEY)
# Let's test it via ssh
ssh <your-name>@<ip> lscpu
```

## Ansible playbook
Note: we are in ansible container

This command is to check playbook before we apply it into 
```sh
ansible-playbook playbook.yaml -i inventory.toml --check --diff
```

If everything is fine, let's apply it
```sh
ansible-playbook playbook.yaml -i inventory.toml --check --diff
```
