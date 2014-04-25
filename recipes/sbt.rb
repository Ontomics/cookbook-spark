#
# Cookbook Name:: spark
# Recipe:: sbt
#

target_file = "#{Chef::Config[:file_cache_path]}/sbt_remote.deb"

remote_file target_file do
  source  "http://dl.bintray.com/sbt/debian/sbt-#{node[:spark][:sbt_version]}.deb"
  action :create
  backup false
end

package target_file do
  provider Chef::Provider::Package::Dpkg
  action :install
  source target_file
  options "--force-all"
  notifies :run, "execute[apt-get update]", :immediately
end

package 'sbt'