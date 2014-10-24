unless ::File.directory?("/Applications/Hopper.app")
	remote_file "#{Chef::Config[:file_cache_path]}/Hopper-#{node['apps']['hopper']['version']}.zip" do
	  source "http://www.hopperapp.com/HopperWeb/downloads/Hopper-#{node['apps']['hopper']['version']}.zip"
	  checksum node['apps']['hopper']['checksum']
	  notifies :run, "execute[unzip-hopper]", :immediately
	end

	execute "unzip-hopper" do
	  command "unzip -o #{Chef::Config[:file_cache_path]}/Hopper-#{}{node['apps']['hopper']['version']}.zip -d /Applications"
	  action :nothing
	end
end