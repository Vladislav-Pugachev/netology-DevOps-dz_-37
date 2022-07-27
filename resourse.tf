resource "yandex_compute_instance" "vector" {
  name                      = "vector"
  zone                      = "ru-central1-a"
  hostname                  = "vector.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "fd80le4b8gt2u33lvubr"
      name        = "root-node01"
      type        = "network-nvme"
      size        = "50"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "vector:${file("./playbook/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "clickhouse" {
  name                      = "clickhouse"
  zone                      = "ru-central1-a"
  hostname                  = "clickhouse.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "fd80le4b8gt2u33lvubr"
      name        = "root-node02"
      type        = "network-nvme"
      size        = "50"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "clickhouse:${file("./playbook/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "lighthouse" {
  name                      = "lighthouse"
  zone                      = "ru-central1-a"
  hostname                  = "lighthouse.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "fd80le4b8gt2u33lvubr"
      name        = "root-node03"
      type        = "network-nvme"
      size        = "50"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "lighthouse:${file("./playbook/id_rsa.pub")}"
  }
}

