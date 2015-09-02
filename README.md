# bumblebee-cookbooks
Cookbooks for setting up the bumblebee server to enable continuous delivery

## Commands
### Bootstrap machine to webserver role
```sh
knife bootstrap {host} --ssh-user {username} --ssh-password '{password}' --sudo --use-sudo-password --run-list=role[webserver]
```

Optionally, you could use the passwordless login method with a keyfile
```sh
knife bootstrap {host} --ssh-user {username} --identity-file {keyfile} --sudo --use-sudo-password --run-list=role[webserver]
```

#### Vagrant specific configs
In case you're testing this on vagrant, here are the default variable names you need
* host: `localhost:2222`
* username: `vagrant`
* password: `vagrant`
* keyfile: `{vagrantDir}\vagrant.key`

### Upload all cookbooks from development workspace
```sh
knife cookbook upload --all
```

### Upload all roles from development workspace
```sh
knife role from file roles/*.rb
```

### Upload all data bags from development workspace
```sh
knife data bag from file --all
```