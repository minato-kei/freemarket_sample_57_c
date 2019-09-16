FactoryBot.define do
  factory :user do
    id                      {467}
    nickname                {"チカキン666"}
    email                   {Faker::Internet.free_email}
    password                {"0000000000"}
    password_confirmation   {"0000000000"}
    reset_password_token    {}
    reset_password_sent_at  {}

    last_name_kanji         {"長宗我部"}
    first_name_kanji        {"元親"}
    last_name_kana          {"チョウソカベ"}
    first_name_kana         {"モトチカ"}
    birthday                {Date.today}
    phone_number            {"09012345678"} 
    balance                 {0}
    sex                     {"male"}
    remember_created_at     {}
    created_at              {Date.today}
    updated_at              {Date.today}
    provider                {}
    uid                     {}
  end
end