#
# Cookbook Name:: git
# Recipe:: default
#
# Copyright (C) 2013 Logan Koester
# 
# All rights reserved - Do Not Redistribute
#

include_recipe 'pacman'

package('git') { action :install }

git "#{Chef::Config[:file_cache_path]}/git-extras" do
  repository 'git://github.com/visionmedia/git-extras.git'
  reference 'master'
  action :sync
end

bash "compile and install git-extras" do
  cwd "#{Chef::Config[:file_cache_path]}/git-extras"
  code 'sudo make install'
end

%w{ autoconf automake bison flex xclip }.each do |pkg|
  package('git') { action :install }
end

%w{ codesearch jq gist gister }.each do |pkg|
  pacman_aur(pkg){ action :build }
  pacman_aur(pkg){ action :install }
end
