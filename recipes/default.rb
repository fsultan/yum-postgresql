#
# Cookbook Name:: yum-postgresql
# Recipe:: default
#
# Copyright (C) 2014 Fahd Sultan
#
# All rights reserved - Do Not Redistribute
#

unless platform_family?("fedora","rhel")
  Chef::Log.error("Unsupported platform family")
end

unless ['x86_64', 'i386'].include? node['yum']['postgresql']['arch']
  Chef::Log.error("Unsupported arch")
end

pg_ver = node['yum']['postgresql']['version']
pg_ver_txt = pg_ver.gsub(/\./, "")

platform_ver_major = node['platform_version'][0,1] 

package_url = node.default['yum']['postgresql'][pg_ver]["#{node["platform"]}"][platform_ver_major]["#{node['yum']['postgresql']['arch']}"]['url']

execute "install repo" do
  user "root"
  command "rpm -Uvh #{package_url}"
  not_if { `rpm -q -a | grep pgdg-` =~ /pgdg-/ }
end
