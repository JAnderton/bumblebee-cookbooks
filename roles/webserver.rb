# These changes need to be duplicated in .kitchen.yml for development
# deployments using kitchen

name "webserver"
description "Chef role for all webserver machines"

run_list(
  "recipe[hostname]",
  "recipe[nginx]",
  "recipe[trion-cookbooks::disable_sites]",
  "recipe[trion-cookbooks::setup_www_root]",
  "recipe[git]",
  "recipe[trion-cookbooks::deploy_default_site]",
  "recipe[trion-cookbooks::deploy_japhet_in]",
  "recipe[trion-cookbooks::deploy_tributetothebeast_com]",
  "recipe[trion-cookbooks::deploy_prorthymix_com]",
  "recipe[trion-cookbooks::install_octopress]",
  "recipe[nodejs]",
  "recipe[trion-cookbooks::deploy_blog_karun_me]"
)
