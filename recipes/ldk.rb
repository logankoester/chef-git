#
# Cookbook Name:: git
# Recipe:: ldk
#
# Copyright (C) 2013 Logan Koester
# 
# All rights reserved - Do Not Redistribute
#

template '/home/ldk/.gitconfig' do
  source 'ldk/gitconfig.erb'
end

directory '/home/ldk/bin' do
  owner 'ldk'
  group 'users'
  mode '0755'
  action :create
end

remote_file '/home/ldk/bin/hub' do
  source 'http://defunkt.io/hub/standalone'
  mode '0755'
  action :create_if_missing
end

ruby_block 'alias git to hub' do
  block do
    file = Chef::Util::FileEdit.new('/home/ldk/.zshrc')
    file.insert_line_if_no_match 'alias -r git="hub"', 'alias -r git="hub"'
    file.write_file
  end
end
