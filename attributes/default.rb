# Script settings
default['bumblebee']['disable_existing_sites'] = false
default['bumblebee']['site_name'] = 'example.com'
default['bumblebee']['default_www_root'] = '/var/www'
# default['bumblebee']['sites'] = [
#   {'name': 'karun.me', 'ssl': { 'enabled': false} },
#   {'name': 'karunab.com', 'ssl': { 'enabled': false} },
#   {'name': 'japhet.in', 'ssl': { 'enabled': false} },
#   {'name': 'prorthymix.com', 'ssl': { 'enabled': false} }
# ]
default['bumblebee']['sites'] = [
  'karun.me',
  'karunab.com',
  'japhet.in',
  'prorthymix.com'
]

# Nginix overrides
default['nginx']['default_site_enabled'] = false
