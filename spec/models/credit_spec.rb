# require 'rails_helper'
# describe Credit do
#   describe "#create" do
#     it "全ての情報が揃っていれば登録可能" do
#       credit = build(:credit)
#       credit.valid?
#       expect(credit).to be_valid
#     end

#     it "tokenが無ければ無効" do
#       credit = build(:credit, token: "")
#       credit.valid?
#       expect(credit.errors[:token]).to include("can't be blank")
#     end

#     # it "user_idが無ければ無効" do
#     #   credit = build(:credit, user_id: "")
#     #   credit.valid?
#     #   expect(credit.errors[:user_id]).to include("can't be blank")
#     # end

#   end
# end