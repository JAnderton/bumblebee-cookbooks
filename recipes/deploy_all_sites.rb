#
# Cookbook Name:: trion-cookbooks
# Recipe:: deploy_all_sites
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

  nginx_site site_config['name'] do
    enable true
  end
end
