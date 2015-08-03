# bumblebee-cookbooks
Cookbooks for setting up the bumblebee server to enable continuous delivery

## Commands
### Bootstrap machine to webserver role
knife bootstrap {host} --ssh-user {username} --ssh-password '{password}' --sudo --use-sudo-password --run-list=role[webserver]

In case you're testing this on vagrant, username and password are 'vagrant' :)

### Upload all cookbooks from development workspace
knife cookbook upload --all
### Upload all roles from development workspace
knife role from file roles/*.rb
### Upload all data bags from development workspace
knife data bag from file --all