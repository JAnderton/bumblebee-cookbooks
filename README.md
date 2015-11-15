trion-cookbooks
===================

Cookbooks for setting up the Trion server to enable continuous delivery

Usage
-----

### trion-cookbooks::default

Include `trion-cookbooks` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[trion-cookbooks::default]"
  ]
}
```

Commands
--------

### Bootstrapping

```
knife bootstrap localhost:2222 --ssh-user vagrant --ssh-password 'vagrant' --sudo --use-sudo-password --run-list=role[webserver]
```

### Update cookbooks, roles and data bags

```
berks upload
knife role from file roles/*.rb
knife data bag from file --all
```

### Download new cookbook

```
berks install <cookbook-name>
```

License and Authors
-------------------

Author: [Karun Japhet](http://karun.me) (karun@japhet.in\)
