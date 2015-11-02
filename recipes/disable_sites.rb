#
# Cookbook Name:: trion-cookbooks
# Recipe:: disable_sites
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

if node['trion']['disable_existing_sites']
  Dir.foreach("#{node['nginx']['dir']}/sites-enabled") do |enabled_site|
    next if enabled_site == '.' or enabled_site == '..'

    nginx_site enabled_site do
      enable false
    end
  end
end
