terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.25.2"
    }
  }
}

provider "digitalocean" {
  token = "dop_v1_11320fa98db7b06335982406d9c48d073975eaf2ec6aa4510e02e82b45fe34c6"
}


resource "digitalocean_droplet" "minecraft" {
  image    = "ubuntu-22-04-x64"
  name     = "minecraft"
  region   = "nyc1"
  size     = "s-2vcpu-2gb"
  ssh_keys = [data.digitalocean_ssh_key.ssh_keys.id]
}

data "digitalocean_ssh_key" "ssh_keys" {
  name = "Jornada DevOps"
}

output "minecraft_ip" {
    value = digitalocean_droplet.minecraft.ipv4_address
}
