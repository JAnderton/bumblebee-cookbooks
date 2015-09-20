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
# Install nginx
include_recipe 'nginx'

# Disable existing sites
if node['bumblebee']['disable_existing_sites']
  Dir.foreach("#{node['nginx']['dir']}/sites-enabled") do |enabled_site|
    next if enabled_site == '.' or enabled_site == '..'

    nginx_site enabled_site do
      enable false
    end
  end
end

# Create site configs and enable them
for site_config in node['bumblebee']['sites'] do
  template "#{node['nginx']['dir']}/sites-available/#{site_config['name']}" do
    source 'nginx-site-with-php-config.erb'
    owner 'root'
    group 'root'
    mode '0644'
    variables({
      :site_config => site_config,
      :www_root => node['bumblebee']['default_www_root']
    })
  end

  nginx_site site_config['name'] do
    enable true
  end
end
