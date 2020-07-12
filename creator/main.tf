resource "virtualbox_vm" "lb" {
  count     = 1
  name      = format("terra-lb-%02d", count.index + 1)
  image     = "https://github.com/ccll/terraform-provider-virtualbox-images/releases/download/ubuntu-15.04/ubuntu-15.04.tar.xz"
 # image     = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"
  cpus      = 2
  memory    = "512 mib"
  user_data = file("user_data")

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet1"
  }
}


resource "virtualbox_vm" "node" {
  count     = 2
  name      = format("terra-node-%02d", count.index + 1)
  image     = "https://github.com/ccll/terraform-provider-virtualbox-images/releases/download/ubuntu-15.04/ubuntu-15.04.tar.xz"
 # image     = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"
  cpus      = 2
  memory    = "512 mib"
  user_data = file("user_data")

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet1"
  }
}

output "IPAddr" {
  value = element(virtualbox_vm.lb.*.network_adapter.0.ipv4_address, 1)
}

output "IPAddr_2" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 2)
}

output "IPAddr_3" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 3)
}


#provider "dns" {
#  update {
#    server        = "192.168.0.1"
#    key_name      = "example.com."
#    key_algorithm = "hmac-md5"
#    key_secret    = "3VwZXJzZWNyZXQ="
#  }
#}

#resource "dns_a_record_set" "www" {
#  zone = "example.com."
#  name = "www"
#  addresses = [
#    element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)
#  ]
#  ttl = 300
#}
