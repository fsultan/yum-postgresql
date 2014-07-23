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

if platform_family?("rhel")
   repo_url_base = "http://yum.postgresql.org/#{pg_ver}/redhat"
 else
   repo_url_base = "http://yum.postgresql.org/#{pg_ver}/#{node['platform_family']}"
end

pg_ver = node['yum']['postgresql']['ver']

case node["platform"]
when "fedora"
  pkg_name = %{pgdg-fedora#{pg_ver.sub! "." ""}-#{:pg_ver}-1.noarch.rpm}
when "redhat"
  pkg_name = %{pgdg-redhat#{pg_ver.sub! "." ""}-#{:pg_ver}-1.noarch.rpm}
when "scientific"
  pkg_name = %{pgdg-sl#{pg_ver.sub! "." ""}-#{:pg_ver}-1.noarch.rpm}
when "oraclelinux"
  pkg_name = %{pgdg-oraclelinux#{pg_ver.sub! "." ""}-#{:pg_ver}-1.noarch.rpm}
when "centos"
  pkg_name = %{pgdg-centos#{pg_ver.sub! "." ""}-#{:pg_ver}-1.noarch.rpm}
end

package_url = "#{:repo_url_base}/#{:pkg_name}"

execute "install repo" do
  user "root"
  command "rpm -Uvh #{package_url}"
  not_if { `rpm -q -a | grep pgdg-` =~ /pgdg-/ }
end
