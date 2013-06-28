#
# Cookbook Name:: imos_r
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
r_package "ncdf4" do
  action :install
end

r_package "aqfig" do
	action :install
end

r_package "maps" do
	action :install
end

r_package "ggplot2" do
	action :install
end

r_package "raster" do
	action :install
end


