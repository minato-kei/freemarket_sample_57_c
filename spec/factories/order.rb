FactoryBot.define do
  factory :order do
    id                      {678}
    item_id                 {1}
    purchase_user_id        {1}
    deal_at                 {"2019-08-30 09:07:58"}
    cancel                  {"購入者によるキャンセル"}
    item_status             {"販売中"}
  end
end