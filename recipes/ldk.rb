#
# Cookbook Name:: git
# Recipe:: ldk
#
# Copyright (C) 2013 Logan Koester
# 
# All rights reserved - Do Not Redistribute
#

# Determine a user's shell
# Example: which_shell?('ldk') => 'bash'
def which_shell?(login)
  line = File.readlines('/etc/passwd').select { |u| u =~ /`^#{Regexp.escape(login)}/ }
  return false unless line
  File.basename( line.split(':').last )
end

template '/home/ldk/.gitconfig' do
  source 'ldk/gitconfig.erb'
  owner 'ldk'
  group 'users'
  mode '0755'
end

directory '/home/ldk/bin' do
  owner 'ldk'
  group 'users'
  mode '0755'
  action :create
end

remote_file '/home/ldk/bin/hub' do
  source 'http://defunkt.io/hub/standalone'
  owner 'ldk'
  group 'users'
  mode '0755'
  action :create_if_missing
end

ruby_block 'alias git to hub' do

  block do
    case which_shell? 'ldk'
    when 'zsh'
      file = Chef::Util::FileEdit.new('/home/ldk/.zshrc')
      file.insert_line_if_no_match 'alias -r git="hub"', 'alias -r git="hub"'
      file.write_file
    when 'bash'
      file = Chef::Util::FileEdit.new('/home/ldk/.bash/alias.sh')
      file.insert_line_if_no_match "alias git='hub'", "alias git='hub'"
    end
  end
end
