# Changelog
All notable changes to this project will be documented in this file.

## [1.3.1] - 2024-10-03

### Added
- WireGuard client configs as output

## [1.3.0] - 2021-03-21

### Added
- Server private key from SSM
- EIP creation
- Route53 with Geo policy
- Update README & examples

## [1.2.0] - 2021-03-12

### Added
- docker-ce
- docker-compose
- prometheus-wireguard-exporter
- friendly_name support

## [1.1.0] - 2021-03-11

### Added
- Update examples
- Update Readme
- Fix tf code
- Refactor tf variables
- Fix iptables rules
- Upgrade Ubuntu 16.04 > 20.04
- Upgrade aws cli v1 > v2
- Install additional packages on the server for debugging & maintenance
- Support for TF v0.13

## [1.0.0] - 2019-10-13
Note that this release contains breaking changes. Hence the major version bump.

### Added
- Support for TF v0.12
- Support for Network Load Balancers
- Variable `instance_type` added.
- Variable `additional_security_group_ids` added to support more flexibility with security groups.
- Variable `eip_id` added to pass in an EIP object
- `asg_min_size`, `asg_max_size`, and `asg_desired_capacity` variables for autoscaling groups.
- Variable `wg_persistent_keepalive` to set keepalive in seconds. Set to 0 to disable.

### Changed
- Variable `public_subnet_ids` renamed to `subnet_ids`
- Ubuntu AMI used will now default to the latest.

### Removed
- An EIP is no longer created in this module, in order to support the option to use a ELB. Instead, a EIP ID must be passed in, if that is the desired configuration.

## [0.0.2] - 2019-03-02
### Added
- Multi-client support via the module variable.
- This CHANGELOG
### Removed
- Single-client public key via AWS SSM as it now conflicts with the module variable method.

## [0.0.1] - 2019-02-24
### Added
- Working module to deploy WireGuard with single client support.
