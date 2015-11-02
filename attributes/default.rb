# Script settings
default['bumblebee']['disable_existing_sites'] = false
default['bumblebee']['site_name'] = 'example.com'
default['bumblebee']['default_www_root'] = '/var/www'
default['bumblebee']['source_www_root'] = '/var/www-source'
default['bumblebee']['sites'] = [
  # {name: 'karun.me', ssl: { enabled: false } },
  # {name: 'karunab.com', ssl: { enabled: false } },
  {name: 'japhet.in', ssl: { enabled: false }, git_location: 'https://github.com/JAnderton/japhet-family-website.git' },
  # {name: 'prorthymix.com', ssl: { enabled: true, certificate_location: '/etc/nginx/ssl/self-ssl.crt', certificate_key_location: '/etc/nginx/ssl/self-ssl.key' } }
]

# Nginix overrides
default['nginx']['default_site_enabled'] = false
