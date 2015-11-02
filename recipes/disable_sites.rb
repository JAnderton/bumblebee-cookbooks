if node['trion']['disable_existing_sites']
  Dir.foreach("#{node['nginx']['dir']}/sites-enabled") do |enabled_site|
    next if enabled_site == '.' or enabled_site == '..'

    nginx_site enabled_site do
      enable false
    end
  end
end
