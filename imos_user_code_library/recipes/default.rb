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

execute "simulink to desktop" do
    command "ln -s  ~/imos_user_code_library ~/Desktop/IMOS_user_code_library"
    cwd "/home/vagrant"
    user "vagrant"
end

# to have a graphical interface
package "xfce4"
package "xfce4-goodies"

# to have a graphical login prompt
package "xdm"
package "xdmx"
