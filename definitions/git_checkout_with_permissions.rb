#
# This file is not a directly invokable recipe. It is a function call that is
# meant to be invoked from other recipies that want to deploy a simple html
# website.
#
# Cookbook Name:: trion-cookbooks
# Recipe:: git_checkout_with_permissions
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

define :git_checkout_with_permissions, :checkout_root => nil do
  git "#{params[:checkout_root]}/#{node['trion']['sites'][params[:name]]['name']}" do
    repository node['trion']['sites'][params[:name]]['git_location']
    revision "master"
    action :sync
    user node['nginx']['user']
    group node['nginx']['group']
  end

  directory "#{params[:checkout_root]}/#{node['trion']['sites'][params[:name]]['name']}" do
    mode '0755'
    recursive true
  end
end
