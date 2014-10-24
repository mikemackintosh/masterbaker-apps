node.default['apps']['bashit']['home'] =  node['etc']['passwd'][node['current_user']]['dir']

node.default['apps']['bashit'] ={
  'version' => '0986e40d6c4c64dc03cce6497294cef17ca57307',
  'enabled_plugins' => {
    'aliases'    => %w[general],
    'completion' => %w[defaults git],
    'plugins'    => %w[ssh]
  },
  'theme' => 'bobby',
  'dir' => ::File.expand_path(".bash_it", node['apps']['bashit']['home']),
  'bashrc_path' => ::File.expand_path(".bash_profile", node['apps']['bashit']['home']),
  'repository' => 'http://github.com/revans/bash-it.git'
}