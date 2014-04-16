users = []

search(:users, 'groups:vpn AND NOT action:remove').each do |u|
  u['username'] ||= u['id']
  users << {:username => u['username'], :vpn_password => u['vpn_password']}
end

template "#{node['openswan']['ppp_path']}/chap-secrets" do
  source "chap-secrets.erb"
  variables({
    :users => users
  })
  notifies :restart, "service[xl2tpd]"
  notifies :restart, "service[ipsec]"
end

