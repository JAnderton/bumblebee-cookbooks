version="12.4.0-1_amd64"
chefInstalled=$(dpkg -s chef|grep install)

echo ">> Checking for chef: $chefInstalled"
if [ "" == "$chefInstalled" ]; then

  echo ">> No chef installation.\nDownloading version $version"
  wget -nc https://opscode-omnibus-packages.s3.amazonaws.com/debian/6/x86_64/chef_$version.deb -O "~/chef_$version.deb"
  echo ">> Installing $version"
  sudo dpkg -i ~/chef_$version.deb
fi

echo ">> Installing git"
sudo apt-get install git

echo ">> Fetching cookbooks"
git clone https://github.com/JAnderton/bumblebee-cookbooks.git
