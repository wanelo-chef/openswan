file "/var/log/ppp-ipupdown.log" do
  action :touch
  not_if { File.exists?("/var/log/ppp-ipupdown.log") } # No touching!
end

execute "turn on ipv4 forwarding" do
  command "echo 1 > /proc/sys/net/ipv4/ip_forward"
  not_if "grep 1 /proc/sys/net/ipv4/ip_forward"
end

bash "turn off redirects" do
  code <<-EOH
  for redirect in `ls /proc/sys/net/ipv4/conf/*/send_redirects`
    do echo 0 > $redirect
  done
  EOH
  not_if "grep 0 /proc/sys/net/ipv4/conf/tunl0/send_redirects"
end

template "#{node['openswan']['xl2tpd_path']}/xl2tpd.conf" do
  source "xl2tpd.conf.erb"
  notifies :restart, "service[xl2tpd]"
end 

template "#{node['openswan']['ppp_path']}/options.xl2tpd" do
  source "options.xl2tpd.erb"
  notifies :restart, "service[xl2tpd]"
end

