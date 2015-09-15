# Knife

## Bootstrapping
```
knife bootstrap localhost:2222 --ssh-user vagrant --ssh-password 'vagrant' --sudo --use-sudo-password --run-list=role[webserver]
```

## Update cookbooks, roles and data bags
```
knife cookbook upload --all
knife role from file roles/*.rb
knife data bag from file --all
```

## Download new cookbook
```
knife install <cookbook-name>
```

# Berks

## Update cookbooks
```
berks upload
```

## Download new cookbook
```
berks install <cookbook-name>
```
