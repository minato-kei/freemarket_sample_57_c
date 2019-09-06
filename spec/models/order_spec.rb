# require 'rails_helper'
# describe Order do
#   describe "#create" do
#     it "全ての情報が揃っていれば登録可能" do
#       order = build(:order)
#       order.valid?
#       expect(order).to be_valid
#     end

#     it "item_idがなければ無効" do
#       order = build(:order, item: nil)
#       expect(order.valid?).to be false
#     end

#     it "purchase_user_idがなければ無効" do
#       order = build(:order, purchase_user_id: "")
#       order.valid?
#       expect(order.errors[:purchase_user_id]).to include("can't be blank")
#     end

#     it "purchase_user_idがなければ無効" do
#       order = build(:order, purchase_user_id: "")
#       order.valid?
#       expect(order.errors[:purchase_user_id]).to include("can't be blank")
#     end

#     it "deal_atがなくても有効" do
#       order = build(:order, deal_at: "")
#       order.valid?
#       expect(order).to be_valid
#     end

#     it "cancelがなくても有効" do
#       order = build(:order, cancel: "")
#       order.valid?
#       expect(order).to be_valid
#     end

#     it "item_statusがなくても有効" do
#       order = build(:order, item_status: "")
#       order.valid?
#       expect(order).to be_valid
#     end
#   end
# end