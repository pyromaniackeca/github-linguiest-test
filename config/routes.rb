Rails.application.routes.draw do

  get "php_test" => "test#php"
  root "test#php"

end
