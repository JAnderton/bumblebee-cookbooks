version="12.4.0-1_amd64"
chefInstalled=$(dpkg -s chef|grep install)

echo ">> Checking for chef: $chefInstalled"
if [ "" == "$chefInstalled" ]; then

  echo ">> No chef installation.\nDownloading version $version"
  wget -nc https://opscode-omnibus-packages.s3.amazonaws.com/debian/6/x86_64/chef_12.4.0-1_amd64.deb
  echo ">> Installing $version"
  sudo dpkg -i chef_$version.deb
fi

#echo ">> Installing git"
#sudo apt-get install git

#echo ">> Setting up git configurations"
#git config --global core.editor "nano"
#git config --global user.name "Karun Japhet"
#git config --global user.email karun@japhet.in
#git config --global push.default simple

#echo ">> Generating SSH keys"
#ssh-keygen -t rsa -b 4096 -C "karun@japhet.in"
