# ansible_container
Looking to place Ansible in a container (i.e. run Ansible in a container to manage other stuff).

If you want to exclude items from the Docker build place the details of them in a .dockerignore file, then make sure to put the .dockerignore file into a .gitignore file as well.

Docker container - https://ghcr.io/cjcshadowsan/ansible_container

## Usage
To use, you can just git clone and build, then run - Or call using something like:

```
docker run -it --name=ansible --privileged --rm \
  --network=host \
  -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
  -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
  -v $(pwd):/ansible/playbooks \
  -v $(pwd)/log:/var/log/ansible \
ghcr.io/cjcshadowsan/ansible_container:master "$@"
```

Clearly you don't need to run privileged, but you may need to.

Note that if you can SSH to it, then copying your key to the temporary container will allow you to run for the lifetime of the container. This is a security risk, you have been warned - So don't use a key that is for anything other than the specific deployment you're working on.

## Running day-to-day - Helper script
There's a helper script here in ansible-helper.sh that you can alias to ansible-playbook and it'll work pretty much just like ansible-playbook, albeit with a slightly slower startup.

## TODO:
Add releases with version(s) - But why not just keep with the times and code your stuff to work with latest, if you can pull this container? Hmmm?
