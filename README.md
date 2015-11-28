trion-cookbooks
===================

Cookbooks for setting up the Trion server to enable continuous delivery

Usage
-----

### Complete server installation

Execute all recipes from `.kitchen.yml`'s run_list in order.
This information is currently duplicated in `.kitchen.yml` and `roles/webserver.rb`

This list of recipes currently is as below:
- `recipe[trion::disable_sites]`
- `recipe[trion::setup_www_root]`
- `recipe[trion::deploy_default_site]`
- `recipe[trion::deploy_japhet_in]`
- `recipe[trion::deploy_tributetothebeast_com]`
- `recipe[trion::deploy_prorthymix_com]`
- `recipe[trion::install_octopress]`
- `recipe[trion::deploy_blog_karun_me]`
- `recipe[trion::deploy_karunab_com]`
- `recipe[trion::deploy_karun_me]`

### What do individual scripts do?

#### trion::disable_sites

Disables all nginx websites on the server

#### trion::install_octopress

Installs Octopress. Needs to be extracted to create a module.

#### trion::setup_www_root

Sets up the default www root for nginx where all websites can be deployed and
Sets up the www source directory where source code can be put for compilation

#### trion::deploy_*

Deploys a website (as per the name of the cookbook)

Commands
--------

### Deployment

#### Bootstrapping

Installs Chef onto target machine, uploads the latest cookbooks from your local machine on the server and executes them.

Pro tip: `bootstrap = init + cook`

```sh
knife solo bootstrap <server_address>
```

#### Cooking

Downloads latest cookbooks on the server for your organization and executes them.

```sh
knife solo cook <server_address>
```

### Development

#### Running cookbooks on vagrant

```sh
kitchen converge
```

#### Running automated tests

```sh
kitchen verify
```

#### Download new cookbook

```sh
berks install <cookbook-name>
```

#### Upload cookbooks, roles and data bags to chef server

This isn't required if you're using knife solo. This is required only if you're using a hosted chef server.

```sh
berks upload
knife role from file roles/*.rb
knife data bag from file --all
```

License and Authors
-------------------

Author: [Karun Japhet](http://karun.me) (karun@japhet.in\)
