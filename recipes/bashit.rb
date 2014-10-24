# From sprout-base, kthxbai!

bash_it_version = node['apps']['bashit']['version']

git "#{Chef::Config[:file_cache_path]}/bash_it" do
  repository node['apps']['bashit']['repository']
  revision node['apps']['bashit']['version']
  destination "#{Chef::Config[:file_cache_path]}/bash_it"
  action :sync
end

directory node['apps']['bashit']['dir'] do
  owner node['apps']['current_user']
  mode "0777"
end

execute "Copying bash-it's .git to #{node['apps']['bashit']['dir']}" do
  command "rsync -axSH #{Chef::Config[:file_cache_path]}/bash_it/ #{node['apps']['bashit']['dir']}"
  user node['apps']['current_user']
end

template node['apps']['bashit']['bashrc_path'] do
  source "bash_it/bashrc.erb"
  cookbook 'apps'
  owner node['apps']['current_user']
  mode "0777"
end

node['apps']['bashit']['enabled_plugins'].each do |feature_type, features|
  features.each do |feature_name|
    bash_it_enable_feature "#{feature_type}/#{feature_name}"
  end
end

node['apps']['bashit']['custom_plugins'].each do |cookbook_name, custom_plugins|
  custom_plugins.each do |custom_plugin|
    bash_it_custom_plugin custom_plugin do
      cookbook cookbook_name
    end
  end
end
