
git "/usr/local/opt/ninetails" do
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
  to "/usr/local/opt/ninetails/ninetails"
end