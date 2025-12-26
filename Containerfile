FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV ANSIBLE_COLLECTIONS_PATHS=/usr/share/ansible/collections:/root/.ansible/collections

RUN apt update && \
    apt install -y \
      tzdata \
      openssh-client \
      sshpass \
      python3-pip && \
    ln -fs /usr/share/zoneinfo/America/Guayaquil /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    pip3 install --no-cache-dir "ansible-core>=2.13,<2.16" && \
    ansible-galaxy collection install ansible.netcommon && \
    rm -rf /var/lib/apt/lists/*


WORKDIR /ansible
