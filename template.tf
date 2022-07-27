resource "local_file" "template_inventory" {
  content     = templatefile("./template_inventory.yml", {
      vector = yandex_compute_instance.vector.network_interface.0.nat_ip_address,
      clickhouse = yandex_compute_instance.clickhouse.network_interface.0.nat_ip_address
      lighthouse = yandex_compute_instance.lighthouse.network_interface.0.nat_ip_address
  })
  filename = "./playbook/prod.yml"
}
resource "local_file" "template_vector_yml_j2" {
  content     = templatefile("./template_vector.yml.j2", {
      clickhouse = yandex_compute_instance.clickhouse.network_interface.0.nat_ip_address
  })
  filename = "./playbook/templates/vector.yml.j2"
}

