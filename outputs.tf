output "wg_config" {
  value = { for idx, client in var.wg_clients :
    client.friendly_name =>
        <<EOF
        [Interface]
        PrivateKey = <PASTE YOUR PRIVATE KEY HERE>
        Address = ${client.client_ip}
        DNS = 8.8.8.8, 1.1.1.1

        [Peer]
        PublicKey = ${var.wg_server_public_key}
        AllowedIPs = ${var.wg_server_net}, ${var.vpc_cidr_block}
        Endpoint = ${aws_eip.wireguard.public_ip}:${var.wg_server_port}
        PersistentKeepalive = 25
        EOF
  }
}