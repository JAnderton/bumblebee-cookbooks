name "webserver"
description "Chef role for all webserver machines"
run_list "recipe[ngnix]"
override_attributes({
  "starter_name" => "Karun Japhet",
})
