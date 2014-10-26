#
# Cookbook Name: apps
# Recipe Name: slack
#
# Copyright 2014, Mike Mackintosh <m@zyp.io>
#
unless ::File.directory?("/Applications/Slack.app")
  remote_file "#{Chef::Config[:file_cache_path]}/Slack.app.zip" do
    source node['apps']['slack']['url']
    checksum node['apps']['slack']['checksum']
  end

  execute "unzip Slack" do
    command "unzip #{Chef::Config[:file_cache_path]}/Slack.app.zip"
    cwd "/Applications"
    not_if { File.directory?("/Applications/Slack.app") }
  end
end
