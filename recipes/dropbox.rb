#
# Cookbook Name: apps
# Recipe Name: dropbox
#
# Copyright 2014, Mike Mackintosh <m@zyp.io>
#
unless ::File.directory?("/Applications/Dropbox.app")
	dmg_package 'Dropbox' do
	  volumes_dir 'Dropbox Installer'
	  source      "https://d1ilhw0800yew8.cloudfront.net/client/Dropbox%20#{node['apps']['dropbox']['version']}.dmg"
	  checksum    node['apps']['dropbox']['checksum']
	  action      :install
	end
end

ruby_block 'exit_if_dropbox_not_configured' do
block do
  raise "\n\nYou should run Dropbox and configure it before proceeding. Run chef again when done\n\n"
end
not_if { File.exists?(File.expand_path("~/.dropbox")) }
end