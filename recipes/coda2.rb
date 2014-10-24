
unless ::File.directory?("/Applications/Coda 2.app")
  remote_file "#{Chef::Config[:file_cache_path]}/Coda%20#{node['apps']['coda2']['version']}.zip" do
    source "http://download.panic.com/coda/Coda%20#{node['apps']['coda2']['version']}.zip"
    checksum node['apps']['coda2']['checksum']
  end

  execute "unzip Coda2" do
    command "unzip #{Chef::Config[:file_cache_path]}/Coda%20#{node['apps']['coda2']['version']}.zip"
    cwd "/Applications"
    not_if { File.directory?("/Applications/Coda 2.app") }
  end
end
