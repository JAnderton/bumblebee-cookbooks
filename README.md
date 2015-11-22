trion-cookbooks
===================

Cookbooks for setting up the Trion server to enable continuous delivery

Usage
-----

### Complete server installation

Execute all recipes from `.kitchen.yml`'s run_list in order.
This information is currently duplicated in `.kitchen.yml` and `roles/webserver.rb`

This list of recipes currently is as below:
- `recipe[nginx]`
- `recipe[hostname]`
- `recipe[git]`
- `recipe[trion-cookbooks::disable_sites]`
- `recipe[trion-cookbooks::setup_www_root]`
- `recipe[trion-cookbooks::deploy_default_site]`
- `recipe[trion-cookbooks::deploy_japhet_in]`
- `recipe[trion-cookbooks::deploy_tributetothebeast_com]`
- `recipe[trion-cookbooks::deploy_prorthymix_com]`

### What do individual scripts do?

#### trion-cookbooks::disable_sites

Disables all nginx websites on the server

#### trion-cookbooks::install_octopress

Installs Octopress. Needs to be extracted to create a module.

#### trion-cookbooks::setup_www_root

Sets up the default www root for nginx where all websites can be deployed and
sets up the www source directory where source code can be put for compilation

#### trion-cookbooks::deploy_japhet_in

Deploys [japhet.in](https://japhet.in)

#### trion-cookbooks::deploy_tributetothebeast_com

Deploys [tributetothebeast.com](https://tributetothebeast.com)

#### trion-cookbooks::deploy_blog_karun_me

Deploys [blog.karun.me](https://blog.karun.me)

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
