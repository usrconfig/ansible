FROM python:3.7

RUN apt update && apt install -y jq
RUN pip3 install ansible

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
