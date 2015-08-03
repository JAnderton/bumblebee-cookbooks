name "webserver"
description "Chef role for all webserver machines"
run_list "recipe[ngnix:2.7.6]"
override_attributes({
  "starter_name" => "Karun Japhet",
})
