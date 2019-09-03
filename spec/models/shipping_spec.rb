# require 'rails_helper'
# describe Shipping do
#   describe "#create" do
#     it "全ての情報が揃っていれば登録可能" do
#       shipping = build(:shipping)
#       shipping.valid?
#       expect(shipping).to be_valid
#     end

#     it "zipcodeがなければ無効" do
#       shipping = build(:shipping, zipcode: "")
#       shipping.valid?
#       expect(shipping.errors[:zipcode]).to include("can't be blank")
#     end

#     it "prefがなければ無効" do
#       shipping = build(:shipping, pref: "")
#       shipping.valid?
#       expect(shipping.errors[:pref]).to include("can't be blank")
#     end

#     it "cityがなければ無効" do
#       shipping = build(:shipping, city: "")
#       shipping.valid?
#       expect(shipping.errors[:city]).to include("can't be blank")
#     end

#     it "addressがなければ無効" do
#       shipping = build(:shipping, address: "")
#       shipping.valid?
#       expect(shipping.errors[:address]).to include("can't be blank")
#     end

#     it "buildingがなくても有効" do
#       shipping = build(:shipping, building: "")
#       shipping.valid?
#       expect(shipping).to be_valid
#     end

#     it "phoneがなくても有効" do
#       shipping = build(:shipping, phone: "")
#       shipping.valid?
#       expect(shipping).to be_valid
#     end

#     it "user_idがなければ無効" do
#       shipping = build(:shipping, user_id: "")
#       shipping.valid?
#       expect(shipping.errors[:user_id]).to include("can't be blank")
#     end

#     it "defaultがなければ無効" do
#       shipping = build(:shipping, default: "")
#       shipping.valid?
#       expect(shipping.errors[:default]).to include("can't be blank")
#     end

    
#   end
# end