data "aws_subnet" "subnet" {
  for_each = toset(var.subnet_ids)
  id = each.value
}

output "wg_config" {
  value = { for idx, client in var.wg_clients :
    client.friendly_name =>
        <<EOF
        [Interface]
        PrivateKey = <PASTE YOUR PRIVATE KEY HERE>
        Address = ${client.client_ip}, ${join(",", [for sub in in data.aws_subnet.subnet : sub.cidr_block])}
        DNS = 8.8.8.8, 1.1.1.1

        [Peer]
        PublicKey = ${var.wg_server_public_key}
        AllowedIPs = ${var.wg_server_net}
        Endpoint = ${aws_eip.wireguard.public_ip}:${var.wg_server_port}
        EOF
  }
}