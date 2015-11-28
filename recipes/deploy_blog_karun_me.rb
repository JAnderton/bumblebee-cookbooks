#
# Cookbook Name:: trion-cookbooks
# Recipe:: deploy_blog_karun_me
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

site_name = 'blog.karun.me'
source_location = node['trion']['source_www_root'] + "/" + site_name
compiled_location = node['trion']['default_www_root'] + "/" + site_name
deploy_config_already_exists = ::File.directory?(source_location + "/_deploy.yml")

trion_git_checkout site_name do
  checkout_root "#{node['trion']['source_www_root']}"
end

execute "installing bundle dependencies for #{site_name}" do
  cwd source_location
  command "bundle install"
end

execute "jekyll build for #{site_name}" do
  cwd source_location
  command "bundle exec jekyll build"
end

execute "octopress deploy init for #{site_name}" do
  cwd source_location
  command "octopress deploy init rsync --dir #{compiled_location} --force"
  user node['nginx']['user']
  group node['nginx']['group']
  not_if deploy_config_already_exists
end

execute "octopress deploy on #{site_name}" do
  cwd source_location
  command "octopress deploy"
  user node['nginx']['user']
  group node['nginx']['group']
end

trion_webserver_config site_name

nginx_site node['trion']['sites'][site_name]['name'] do
  enable true
end
