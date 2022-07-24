#!/usr/bin/env bash

sudo docker run -it --name=ansible --privileged --rm \
  --network=host \
  -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
  -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
  -v $(pwd):/ansible/playbooks \
  -v $(pwd)/ansible.log:/var/log/ansible/ansible.log \
ghcr.io/cjcshadowsan/ansible_container:master "$@"
