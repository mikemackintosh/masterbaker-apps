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

link "" do
  to 
end

remote_file "Copy ninetails" do 
  path "/usr/local/bin/ninetails" 
  source "file://#{Chef::Config[:file_cache_path]}/ninetails/ninetails"
  owner 'root'
  group 'root'
  mode 0755
end