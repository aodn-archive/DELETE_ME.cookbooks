#
# Cookbook Name:: imos_user_code_library
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

 execute "CLONE ucl" do
    command "git clone https://github.com/aodn/imos_user_code_library"
    not_if { ::File.exists?("/home/vagrant/imos_user_code_library")}
    cwd "/home/vagrant"
    user "vagrant"
end
