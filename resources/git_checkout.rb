#
# Cookbook Name:: trion-cookbooks
# Resource:: git_checkout
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
property :checkout_root, String, required: true

action :create do
  git "#{checkout_root}/#{node['trion']['sites'][site_name]['name']}" do
    repository node['trion']['sites'][site_name]['git_location']
    revision "master"
    action :sync
    user node['nginx']['user']
    group node['nginx']['group']
  end

  directory "#{checkout_root}/#{node['trion']['sites'][site_name]['name']}" do
    mode '0755'
    recursive true
  end
end
