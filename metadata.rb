name             'trion-cookbooks'
maintainer       'Karun Japhet'
maintainer_email 'karun@japhet.in'
license          'Apache 2.0'
description      'Cookbooks for setting up the trion server to enable continuous delivery'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

depends 'nginx'
depends 'git'
