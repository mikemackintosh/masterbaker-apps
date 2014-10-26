#
# Cookbook Name: apps
# Recipe Name: knox
#
# Copyright 2014, Mike Mackintosh <m@zyp.io>
#
unless ::File.directory?("/Applications/Knox.app")
    remote_file "Knox :: Download the software to #{Chef::Config[:file_cache_path]}/Knox-#{node['apps']['knox']['version']}.zip" do
      checksum node['apps']['knox']['checksum']
      path "#{Chef::Config[:file_cache_path]}/Knox-#{node['apps']['knox']['version']}.zip"
      source "https://d13itkw33a7sus.cloudfront.net/dist/K/Knox-#{node['apps']['knox']['version']}.zip"
    end

    execute "Knox :: Unzip the archive and install into /Applications" do
      cwd "/Applications/"
      command "unzip #{Chef::Config[:file_cache_path]}/Knox-#{node['apps']['knox']['version']}.zip"
      not_if { ::File.directory?("/Applications/Knox.app") }
    end
end