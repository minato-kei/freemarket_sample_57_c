FactoryBot.define do
  factory :item do
    name                    {"豊臣秀吉からもらった饅頭"}
    price                   {15000}
    size                    {""}
    condition               {"新品同様"}
    cost_burden             {1}
    shipping_from           {"高知県"}
    shipping_day            {"1~2日以内に発送"}
    rating                  {}
    status                  {"出品中"}

    user                    {FactoryBot.build :user}
    shipping                {FactoryBot.build :shipping}
    category                {FactoryBot.build :category}
  end
end