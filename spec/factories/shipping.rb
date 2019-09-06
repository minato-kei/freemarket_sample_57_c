FactoryBot.define do
  factory :shipping do
    zipcode            {7810262}
    pref               {"高知県"}
    city               {"高知市"}
    address            {"浦戸"}
    building           {"浦戸城501"}
    phone              {12345678901}
    default            {true}

    user               {FactoryBot.create :user}
  end
end