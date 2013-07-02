#
# Cookbook Name:: imos_user_code_library
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "git"

execute "CLONE ucl" do
    command "git clone https://github.com/aodn/imos_user_code_library"
    not_if { ::File.exists?("/home/vagrant/imos_user_code_library")}
    cwd "/home/vagrant"
    user "vagrant"
end




# to have a graphical login prompt
package "xorg"
package "lxdm"
package "slim"

# really lightweight graphical environment
package "e17"

package "chromium-browser"
package "mousepad"

execute "e17 profile" do
    command "wget http://data.aodn.org.au/IMOS/public/eMII/demos/e17.tar.gz; tar -xzf e17.tar.gz"
    cwd "/home/vagrant"
    user "vagrant"
end



execute "simulink to desktop" do
    command "mkdir -p /home/vagrant/Desktop ; ln -s /home/vagrant/imos_user_code_library /home/vagrant/Desktop/IMOS_user_code_library"
    not_if { ::File.exists?("/home/vagrant/Desktop/IMOS_user_code_library")}
    cwd "/home/vagrant"
    user "vagrant"
end

execute "slimMain" do
    command "rm /etc/X11/default-display-manager; echo '/usr/bin/slim' > /etc/X11/default-display-manager  "
    user "root"
end




#execute "autologin" do
#    command "sed -i '$ a\login_cmd           exec /usr/bin/enlightenment_start  \rdefault_user       vagrant \rauto_login          yes '  /etc/slim.conf;"
#    user "root"
#end
execute "autologin" do
    command "echo 'login_cmd     exec /usr/bin/enlightenment_start' >> /etc/slim.conf;echo 'default_user    vagrant' >> /etc/slim.conf;echo 'auto_login    yes' >> /etc/slim.conf;"
    user "root"
end



execute "restart VM" do
    command "shutdown -r now"
    user "root"
end

