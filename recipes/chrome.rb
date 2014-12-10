#
# Cookbook Name: apps
# Recipe Name: chrome
#
# Copyright 2014, Mike Mackintosh <m@zyp.io>
#
unless ::File.directory?("/Applications/Google Chrome.app")
	dmg_package 'Google Chrome' do
	  dmg_name 'googlechrome'
	  source   'https://dl-ssl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg'
	  checksum '07c5ccddc5122825130d5c4611bfd7a921be1f7baeac987d078736eef1566153'
	  action   :install
	end
end
