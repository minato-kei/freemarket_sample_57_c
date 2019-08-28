class Order < ApplicationRecord
  require 'payjp'
  Pay.api_key = "sk_test_f4c8afd7cd63a69cc9b6fcd6"
  Payjp.open_timeout = 60
  Payjp.open_timeout = 120

end
