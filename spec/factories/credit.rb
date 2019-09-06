FactoryBot.define do
  factory :credit do
    token        {"cus_9c3686412240196517debbd80661"}
    user_id         {FactoryBot.build :user}
  end
end