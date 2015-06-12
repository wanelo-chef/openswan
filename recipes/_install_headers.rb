remote_file "/var/tmp/linux-image-3.8.4-joyent-ubuntu-12-opt_1.0.0_amd64.deb" do
  source "https://us-east.manta.joyent.com/wanelo/public/cache/openswan/linux-image-3.8.4-joyent-ubuntu-12-opt_1.0.0_amd64.deb"
end

remote_file "/var/tmp/linux-headers-3.8.4-joyent-ubuntu-12-opt_1.0.0_amd64.deb" do
  source "https://us-east.manta.joyent.com/wanelo/public/cache/openswan/linux-headers-3.8.4-joyent-ubuntu-12-opt_1.0.0_amd64.deb"
end

execute "install custom joyent linux headers" do
  command "dpkg --install --force-confnew /var/tmp/linux-headers-3.8.4-joyent-ubuntu-12-opt_1.0.0_amd64.deb && dpkg --install --force-confnew /var/tmp/linux-image-3.8.4-joyent-ubuntu-12-opt_1.0.0_amd64.deb"
  not_if "ls /lib/modules/3.8.4-joyent-ubuntu-12-opt/kernel"
end

