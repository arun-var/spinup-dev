# spinup-dev
An example repo to spin up a dev environment with a load balancer and web servers on virtualbox using terraform/vagrant and ansible.
While using terraform, third party provider needs to be installed. The following provider needs to be placed at <HOME_DIR>/.terraform.d/plugins/<platform> =>
https://github.com/terra-farm/terraform-provider-virtualbox/releases/tag/v0.2.0

Note: With terraform virtualbox provider I was able to get it working with ubuntu 15 image only.
Vagrant spawns ubuntu 18 VMs.
