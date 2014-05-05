default['openswan']['ppp_link_network'] = "10.55.55.0"
default['openswan']['preshared_key'] = "letmein"
default['openswan']['private_virtual_interface_ip'] = "10.55.55.4"
default['openswan']['private_ip'] = node['privateaddress']
default['openswan']['private_ip_range'] = "10.55.55.5-10.55.55.100"
default['openswan']['xl2tpd_path'] = "/etc/xl2tpd"
default['openswan']['ppp_path'] = "/etc/ppp"
default['openswan']['tunnel']['connections'] = {}
#
# add connections in the following way:
#
# Subnets to route to on this side of VPN
# default['openswan']['tunnel']['connections']['office-vpn']['local']['subnets'] = [ "10.10.10.0/24", "10.10.12.0/24" ]
# Subnets to route to on the other side of VPN (office subnets)
# default['openswan']['tunnel']['connections']['office-vpn']['remote']['subnets'] = [ "192.168.0.0/24" ]
# Remote IP of the office VPN firewall
# default['openswan']['tunnel']['connections']['office-vpn']['remote']['ipaddress'] = ''
#
# Add more than one connection by adding another key into 'connections' hash.

