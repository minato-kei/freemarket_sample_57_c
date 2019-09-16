FactoryBot.define do
  factory :item do
    id                      {300}
    name                    {"豊臣秀吉からもらった饅頭"}
    price                   {15000}
    size_id                    {""}
    condition_id               {"新品同様"}
    cost_burden_id             {1}
    shipping_from           {"高知県"}
    shipping_day_id            {"1~2日以内に発送"}
    rating                  {1}
    status_id                  {"出品中"}
    created_at              {Date.today}
    updated_at              {Date.today}


    user_id                    {FactoryBot.build :user}
    shipping_id                {FactoryBot.build :shipping}
    category_id                {FactoryBot.build :category}
    text                    {1111}
  end
end