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



# to have a graphical interface
#package "xfce4"
#package "xfce4-goodies"
#package "xfce4-utils"
#package "xfce4-session"
#package "xfce4-power-manager"

# to have a graphical login prompt
#package "xdm"
package "xauth"
package "lxdm"

# really lightweight graphical environment
package "e17"

package "chromium-browser"

execute "e17 profile" do
    command "wget http://data.aodn.org.au/IMOS/public/eMII/demos/profile.cfg; mv profile.cfg ~/.e/e/config/profile.cfg"
    cwd "/home/vagrant"
    user "vagrant"
end



execute "simulink to desktop" do
    command "mkdir Desktop ; ln -s /home/vagrant/imos_user_code_library /home/vagrant/Desktop/IMOS_user_code_library"
    cwd "/home/vagrant"
    user "vagrant"
end

execute "restart VM" do
    command "shutdown -r now"
    user "root"
end
