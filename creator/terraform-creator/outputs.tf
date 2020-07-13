resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
  lb-dns = element(virtualbox_vm.lb.*.network_adapter.0.ipv4_address, 1),
  lb-ip = element(virtualbox_vm.lb.*.network_adapter.0.ipv4_address, 1),
  webserver-ip = virtualbox_vm.node.*.network_adapter.0.ipv4_address,
  webserver-dns = virtualbox_vm.node.*.network_adapter.0.ipv4_address
 }
 )
 filename = "../provisioner/inventory/local_hosts"
}
