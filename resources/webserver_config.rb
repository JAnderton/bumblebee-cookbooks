#
# Cookbook Name:: trion-cookbooks
# Resource:: webserver_config
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

property :site_name, String, name_property: true

action :create_site do
  template "#{node['nginx']['dir']}/sites-available/#{node['trion']['sites'][site_name]['name']}" do
    source 'nginx-site-config.erb'
    owner node['nginx']['user']
    group node['nginx']['group']
    mode '0644'
    variables({
      :site_config => node['trion']['sites'][site_name],
      :www_root => node['trion']['default_www_root']
    })
  end
end

action :create_redirect do
  template "#{node['nginx']['dir']}/sites-available/#{node['trion']['sites'][site_name]['name']}" do
    source 'nginx-redirect-config.erb'
    owner node['nginx']['user']
    group node['nginx']['group']
    mode '0644'
    variables({
      :site_config => node['trion']['sites'][site_name],
      :www_root => node['trion']['default_www_root']
    })
  end
end
