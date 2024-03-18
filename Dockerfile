# Verwende Ubuntu 20.04 LTS als Basis
FROM ubuntu:20.04

# Vermeide Dialoge mit apt, die Nutzereingaben erfordern
ARG DEBIAN_FRONTEND=noninteractive

# Installiere Software-Properties, damit du PPAs hinzufügen kannst
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository --yes --update ppa:ansible/ansible

# Installiere Ansible
RUN apt-get install -y ansible

# Stelle sicher, dass UTF-8 verwendet wird
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# [Optional] Füge zusätzliche Befehle hinzu, um Playbooks zu kopieren und auszuführen
# COPY ./my-playbook.yml /root/my-playbook.yml
# RUN ansible-playbook /root/my-playbook.yml

# Definiere das Standardverhalten des Containers
CMD [ "ansible-playbook", "--version" ]
