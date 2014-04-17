openswan
========

Collection of recipes that configure and install Ubuntu-based networking VPN gateway, with support for for both peer-to-peer and site-to-site VPN. It includes installation and configuration of ipsec and xl2tpd, as well as iptables services for NAT routing.

### L2TP over IpSec VPN

This recipe installs and configures openswan services for per-user l2tp over ipsec vpn access. 

### Tunneling Cisco ASA Compatible site-to-site VPN

This recipe installs site-to-site VPN that's been verified to work with Cisco ASA 5000 series appliances. 

## Requirements

Currently tested only on Ubuntu 12.

### Peer to Peer

Expects a 'users' databag, with user records formatted like this:

```json
{
    "groups":["sysadmin", "vpn"],
    "comment":"Jane Doe",
    "username":"jane",
    "id":"jane",
    ...
    "vpn_password":"someverysecurepassword"
}
```

In order to remove user record without deleting the data bag, add a key to the databag as follows:

```json
{
    "groups":["sysadmin", "vpn"],
    "comment":"Jane Doe",
    "username":"jane",
    "id":"jane",
    ...
    "vpn_password":"someverysecurepassword",
    "action": "remove"
}
```

This follows a precedent set in the `users` cookbook maintained by Opscode.

### Site to Site

Example configuration:

```ruby
# Define locally routable subnets
node.override['openswan']['tunnel']['local']['subnets'] = %w(
  10.10.10.0/22
  10.10.20.128/25
  # etc...
)

# External to OpenSwan site's local subnet
node.override['openswan']['tunnel']['remote']['subnet'] = '192.168.2.0/23'

# Cisco ASA external IP
node.override['openswan']['tunnel']['remote']['ipaddress'] = 'W.X.Y.Z' 

# Run the recipe
include_recipe 'openswan::tunnel'
```

### Attributes

Default attributes should be overwritten to match your role or environment needs.

    default['openswan']['ppp_link_network'] = "10.55.55.0"
    default['openswan']['preshared_key'] = "letmein"
    default['openswan']['private_virtual_interface_ip'] = "10.55.55.4"
    default['openswan']['private_ip_range'] = "10.55.55.5-10.55.55.100"
    default['openswan']['xl2tpd_path'] = "/etc/xl2tpd"
    default['openswan']['ppp_path'] = "/etc/ppp"

