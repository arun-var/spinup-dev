
# spinup-dev [![Build Status](https://travis-ci.com/mushycode/spinup-dev.svg?branch=master)](https://travis-ci.com/mushycode/spinup-dev)

An example repo to spin up a dev environment with a load balancer and web servers
on virtualbox using terraform/vagrant and ansible. While using terraform,
third party provider needs to be installed. The provider needs to be placed at
`<HOME_DIR>/.terraform.d/plugins/<platform>`. The provider can be downloaded
from this [link](https://github.com/terra-farm/terraform-provider-virtualbox/releases/tag/v0.2.0)

**UPDATE**: Currently focussed on vagrant and ansible provisioning.

## Tested using
1) ansible 2.9.10


## Steps to Run

1. Clone the repository.

2. commands

```console

mushycode@dev:~$ cd spinup-dev/creator/vagrant-creator

mushycode@dev:~$ vagrant up --provision

mushycode@dev:~$ cd ../../provisioner

mushycode@dev:~$ ansible-playbook -i ../creator/vagrant-creator/.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
test.yml

mushycode@dev:~$ curl 172.16.0.10

```

## Things to Do

1. ~~add travis checks~~
2. ~~setup molecule~~
3. ~~fix molecule vagrant driver issues~~
4. ~~fix molecule provisioning~~
5. write tests

Note: With terraform virtualbox provider I was able to get it working with
ubuntu 15 image only. Vagrant spawns ubuntu 18 VMs.
