#
# Cookbook Name: apps
# Recipe Name: alfred2
#
# Copyright 2014, Mike Mackintosh <m@zyp.io>
#
unless ::File.directory?("/Applications/Alfred 2.app")
	remote_file "#{Chef::Config[:file_cache_path]}/Alfred_#{node['apps']['alfred']['version']}.zip" do
	  source "http://cachefly.alfredapp.com/Alfred_#{node['apps']['alfred']['version']}.zip"
	  checksum node['apps']['alfred']['checksum']
	  notifies :run, "execute[unzip-alfred]", :immediately
	end

	execute "unzip-alfred" do
	  command "unzip -o #{Chef::Config[:file_cache_path]}/Alfred_#{node['apps']['alfred']['version']}.zip -d /Applications"
	  action :nothing
	end
end