#
# Cookbook Name:: .
# Recipe:: default
#
# Copyright (C) 2015 Karun Japhet
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Todo:
# 1) Modularize this file

# Install nginx
# include_recipe 'nginx'

# Disable existing sites
# disable_all_sites

# Installs git
# git_install

directory node['trion']['default_www_root'] do
  owner node['nginx']['user']
  group node['nginx']['group']
  mode '0755'
  recursive true
end

# Create site configs and enable them
for site_config in node['trion']['sites'] do
  template "#{node['nginx']['dir']}/sites-available/#{site_config['name']}" do
    source 'nginx-site-config.erb'
    owner node['nginx']['user']
    group node['nginx']['group']
    mode '0644'
    variables({
      :site_config => site_config,
      :www_root => node['trion']['default_www_root']
    })
  end

  # Create directory for the source code and put source code there
  # source_location = "#{node['trion']['source_www_root']}/#{site_config['name']}/#{Time.now.getutc.to_i}"
  # directory source_location do
  #   owner node['nginx']['user']
  #   group node['nginx']['group']
  #   recursive true
  # end
  # git source_location do
  #   repository site_config['git_location']
  #   revision "master"
  #   action :sync
  # end

  git "#{node['trion']['default_www_root']}/#{site_config['name']}" do
    repository site_config['git_location']
    revision "master"
    action :sync
    user node['nginx']['user']
    group node['nginx']['group']
  end

  directory "#{node['trion']['default_www_root']}/#{site_config['name']}" do
    mode '0755'
    recursive true
  end

  # Link source code with nginx
  # link "#{node['trion']['default_www_root']}/#{site_config['name']}" do
  #   to source_location
  # end

  # Enable all sites
  nginx_site site_config['name'] do
    enable true
  end
end
