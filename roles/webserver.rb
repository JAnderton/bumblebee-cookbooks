# These changes need to be duplicated in .kitchen.yml for development
# deployments using kitchen

name "webserver"
description "Chef role for all webserver machines"

run_list(
  "recipe[nginx]",
  "recipe[hostname]",
  "recipe[git]",
  "recipe[trion-cookbooks::disable_sites]",
  "recipe[trion-cookbooks::setup_www_root]",
  "recipe[trion-cookbooks::deploy_default_site]",
  "recipe[trion-cookbooks::deploy_japhet_in]",
  "recipe[trion-cookbooks::deploy_tributetothebeast_com]",
  "recipe[trion-cookbooks::deploy_prorthymix_com]",
)
