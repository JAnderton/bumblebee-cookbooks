# Script settings
default['trion']['disable_existing_sites'] = false
default['trion']['default_www_root'] = '/var/www'
default['trion']['source_www_root'] = '/var/www-source'

# Websites Config
default['trion']['sites']['japhet.in'] = {name: 'japhet.in', ssl: { enabled: false }, git_location: 'https://github.com/JAnderton/japhet-family-website.git' }
default['trion']['sites']['tributetothebeast.com'] = {name: 'tributetothebeast.com', ssl: { enabled: false }, git_location: 'https://github.com/JAnderton/tribute-to-the-beast.git' }
default['trion']['sites']['prorthymix.com'] = {name: 'prorthymix.com', ssl: { enabled: false }, git_location: 'https://github.com/JAnderton/prorthymix-website.git' }
default['trion']['sites']['blog.karun.me'] = {name: 'blog.karun.me', ssl: { enabled: false }, git_location: 'https://github.com/JAnderton/roacm.git' }
default['trion']['sites']['karunab.com'] = {name: 'karunab.com', redir_url: 'blog.karun.me' }
default['trion']['sites']['karun.me'] = {name: 'karun.me', ssl: { enabled: false }, git_location: 'https://github.com/JAnderton/karun.me.git' }

# Nginix overrides
default['nginx']['default_root'] = '/var/www/default-site'

# Server settings
default['trion']['server_name'] = 'Cybershark'
default['set_fqdn'] = 'Cybershark.trion'
