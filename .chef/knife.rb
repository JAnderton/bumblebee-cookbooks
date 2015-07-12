# See https://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "karun"
client_key               "#{current_dir}/karun.pem"
validation_client_name   "prorthymix-validator"
validation_key           "#{current_dir}/prorthymix-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/prorthymix"
cookbook_path            ["#{current_dir}/../cookbooks"]
