FactoryBot.define do
  factory :shipping do
    
    zipcode            {7810262}
    pref               {1}
    city               {"高知市"}
    address            {"浦戸"}
    building           {"浦戸城501"}
    phone              {00000000}
    default            {1}
    created_at         {Date.today}
    updated_at         {Date.today}

    user
  end
end