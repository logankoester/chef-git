#
# Cookbook Name:: git
# Recipe:: default
#
# Copyright (C) 2013 Logan Koester
# 
# All rights reserved - Do Not Redistribute
#

package('git') { action :install }

git "#{Chef::Config[:file_cache_path]}/git-extras" do
  repository 'git://github.com/visionmedia/git-extras.git'
  reference 'master'
  action :sync
end

bash "compile and install git-extras" do
  cwd "#{Chef::Config[:file_cache_path]}/git-extras"
  user 'ldk'
  group 'users'
  code 'sudo make install'
end
