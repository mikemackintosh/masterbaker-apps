#
# Cookbook Name: apps
# Recipe Name: viscosity
#
# Copyright 2014, Mike Mackintosh <m@zyp.io>
#
unless ::File.directory?("/Applications/Viscosity.app")
	dmg_package 'Viscosity' do
	  volumes_dir 'Viscosity'
	  source      "http://swupdate.sparklabs.com/download/mac/release/viscosity/Viscosity%20#{node['apps']['viscosity']['version']}.dmg"
	  checksum    node['apps']['viscosity']['checksum']
	  action      :install
	end
end