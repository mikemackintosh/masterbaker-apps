#
# Cookbook Name: apps
# Recipe Name: Kaleidoscope
#
# Copyright 2014, Mike Mackintosh <m@zyp.io>
#
unless ::File.directory?("/Applications/Kaleidoscope.app")
    remote_file "Kaleidoscope :: Download the software to #{Chef::Config[:file_cache_path]}/Kaleidoscope-#{node['apps']['kaleidoscope']['version']}.zip" do
      checksum node['apps']['kaleidoscope']['checksum']
      path "#{Chef::Config[:file_cache_path]}/Kaleidoscope-#{node['apps']['kaleidoscope']['version']}.zip"
      source "http://cdn.kaleidoscopeapp.com/releases/Kaleidoscope-#{node['apps']['kaleidoscope']['version']}.zip"
    end

    execute "Kaleidoscope :: Unzip the archive and install into /Applications" do
      cwd "/Applications/"
      command "unzip #{Chef::Config[:file_cache_path]}/Kaleidoscope-#{node['apps']['kaleidoscope']['version']}.zip"
      not_if { ::File.directory?("/Applications/Kaleidoscope.app") }
    end
end