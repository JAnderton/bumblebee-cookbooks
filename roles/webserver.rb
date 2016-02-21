# These changes need to be duplicated in .kitchen.yml for development
# deployments using kitchen

name "webserver"
description "Chef role for all webserver machines"

run_list(
  "recipe[trion::shim_includer]",
)
