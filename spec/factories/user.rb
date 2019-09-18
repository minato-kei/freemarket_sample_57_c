FactoryBot.define do
  factory :user do
    nickname                {"チカキン666"}
    sequence(:email)        {Faker::Internet.email}
    password                {"00000000"}
    password_confirmation   {"00000000"}
    last_name_kanji         {"長宗我部"}
    first_name_kanji        {"元親"}
    last_name_kana          {"チョウソカベ"}
    first_name_kana         {"モトチカ"}
    birthday                {Date.today}
    phone_number            {"09012345678"} 
    balance                 {100000}
    sex                     {"male"}
    remember_created_at     {}
    created_at              {Date.today}
    updated_at              {Date.today}
    provider                {}
    uid                     {}
  end
end