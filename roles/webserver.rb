name "webserver"
description "Chef role for all webserver machines"
run_list [
  "recipe[nginx]"
]
override_attributes({
  "starter_name" => "Karun Japhet",
})
