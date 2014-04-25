#
# Cookbook Name:: spark-cookbook
# Recipe:: download_from_source
#
version = node[:spark][:version]
install_dir = node[:spark][:install_dir]
spark_base = "spark-#{node[:spark][:version]}"

# Create user and group
group node[:spark][:group] do
  action :create
end

user node[:spark][:user] do
  gid node[:spark][:group]
end

# Download source
download_url = "http://d3kbcqa49mib13.cloudfront.net/spark-#{node[:spark][:version]}.tgz"
download_to_path = ::File.join Chef::Config[:file_cache_path], spark_base, '.tgz'
remote_file download_to_path do
  mode "0644"
  source download_url
  action :create
  not_if "test -f #{download_to_path}"
end

# Create install directory
directory node[:spark][:install_dir] do
  owner node[:spark][:user]
  mode "0755"
end

# Extract downloaded source file
unless ::File.exists?(::File.join(node[:spark][:install_dir], spark_base))
  execute 'extract downloaded file' do
    user node[:spark][:user]
    group node[:spark][:user]
    creates "#{node[:spark][:install_dir]}/spark-#{node[:spark][:version]}"
    cwd node[:spark][:install_dir]
    command "tar -zxvf #{download_to_path}"
  end
end