FactoryBot.define do
  factory :user do
    nickname                {"チカキン"}
    email                   {"gabriel.pacocha@hartmann.io"}
    password                {"00000000"}
    password_confirmation   {"00000000"}
    first_name_kanji        {"元親"}
    last_name_kanji         {"長宗我部"}
    first_name_kana         {"モトチカ"}
    last_name_kana          {"チョウソカベ"}
    birthday                {2}
    phone_number            {1} 
    balance                 {0}
    sex                     {"male"}
  end
end