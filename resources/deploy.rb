#
# Cookbook Name:: trion-cookbooks
# Resource:: deploy_site
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

action :html do
  trion_webserver_config site_name do
    action :create_site
  end

  trion_git_checkout site_name do
    checkout_root node['trion']['default_www_root']
    action :create
  end

  nginx_site node['trion']['sites'][site_name]['name'] do
    enable true
  end

  service 'nginx' do
    action [:reload]
  end
end

action :redirect do
  trion_webserver_config site_name do
    action :create_redirect
  end

  nginx_site node['trion']['sites'][site_name]['name'] do
    enable true
  end

  service 'nginx' do
    action [:reload]
  end
end
