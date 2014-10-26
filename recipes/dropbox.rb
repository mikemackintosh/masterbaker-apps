unless ::File.directory?("/Applications/Dropbox.app")
	dmg_package 'Dropbox' do
	  volumes_dir 'Dropbox Installer'
	  source      "https://d1ilhw0800yew8.cloudfront.net/client/Dropbox%20#{node['apps']['dropbox']['version']}.dmg"
	  checksum    node['apps']['dropbox']['checksum']
	  action      :install
	end
end