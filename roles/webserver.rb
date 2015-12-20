# These changes need to be duplicated in .kitchen.yml for development
# deployments using kitchen

name "webserver"
description "Chef role for all webserver machines"

run_list(
  "recipe[hostname]",
  "recipe[nginx]",
  "recipe[trion::disable_sites]",
  "recipe[trion::setup_www_root]",
  "recipe[git]",
  "recipe[trion::deploy_default_site]",
  "recipe[trion::deploy_japhet_in]",
  "recipe[trion::deploy_tributetothebeast_com]",
  "recipe[trion::deploy_prorthymix_com]",
  "recipe[build-essential]",
  "recipe[trion::install_octopress]",
  "recipe[nodejs]",
  "recipe[trion::deploy_blog_karun_me]",
  "recipe[trion::deploy_karunab_com]",
  "recipe[trion::deploy_karun_me]",
  "recipe[trion::deploy_karun_japhet_in]"
)
