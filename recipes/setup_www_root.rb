directory node['trion']['default_www_root'] do
  owner node['nginx']['user']
  group node['nginx']['group']
  mode '0755'
  recursive true
end
