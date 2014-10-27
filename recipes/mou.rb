#
# Cookbook Name: apps
# Recipe Name: mou
#
# Copyright 2014, Mike Mackintosh <m@zyp.io>
#
unless ::File.directory?("/Applications/Mou.app")
    remote_file "Mou :: Download the software to #{Chef::Config[:file_cache_path]}/Mou.zip" do
      checksum '2fe0662d7901e60e051ef2231f2d573329fd6eba'
      path "#{Chef::Config[:file_cache_path]}/Mou.zip"
      source "http://25.io/mou/download/Mou.zip"
    end

    execute "Mou :: Unzip the archive and install into /Applications" do
      cwd "/Applications/"
      command "unzip #{Chef::Config[:file_cache_path]}/Mou.zip"
      not_if { ::File.directory?("/Applications/Mou.app") }
    end
end