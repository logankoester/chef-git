include_recipe 'pacman'

package('git') { action :install }
package('hub') { action :install }
package('jq') { action :install }

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
  package(pkg) { action :install }
end

%w{ gist }.each do |pkg|
  pacman_aur(pkg){ action [:install] }
end

pacman_aur('gitsh'){ action [:install] }
