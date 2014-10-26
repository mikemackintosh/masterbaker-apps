unless ::File.directory?("/Applications/Dropbox.app")
	dmg_package 'Dropbox' do
	  volumes_dir 'Dropbox Installer'
	  source      'https://www.dropbox.com/download?plat=mac'
	  checksum    '0b21a207366f44bfab270eb2a4ae00c20ff43b32'
	  action      :install
	end
end