FactoryBot.define do
  factory :item do
    name                       {"豊臣秀吉からもらった饅頭"}
    price                      {100}
    size_id                    {""}
    condition_id               {1}
    cost_burden_id             {1}
    shipping_from              {2}
    shipping_day_id            {1}
    rating                     {}
    status_id                  {1}
    text                       {"臭い"}
  end
end