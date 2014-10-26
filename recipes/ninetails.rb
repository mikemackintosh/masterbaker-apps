#
# Cookbook Name: apps
# Recipe Name: ninetails
#
# Copyright 2014, Mike Mackintosh <m@zyp.io>
#
git "#{Chef::Config[:file_cache_path]}/ninetails" do
  repository node['apps']['ninetails']['repository']
  revision node['apps']['ninetails']['version']
  destination "#{Chef::Config[:file_cache_path]}/ninetails"
  action :sync
end

execute "Installing ninetails dependencies" do
  command "pip install -r requirements.txt"
  cwd "#{Chef::Config[:file_cache_path]}/ninetails"
  user 'root'
end

link "/usr/local/bin/ninetails" do
  to "#{Chef::Config[:file_cache_path]}/ninetails/ninetails"
  link_type :hard
end