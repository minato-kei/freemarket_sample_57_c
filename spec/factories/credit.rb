FactoryBot.define do
  factory :credit do
    id           {45}
    token        {"cus_9c3686412240196517debbd80661"}
    user         {FactoryBot.build :user}
  end
end