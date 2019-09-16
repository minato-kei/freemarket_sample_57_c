# require 'rails_helper'
# describe Picture do
#   describe "#create" do
#     it "全ての情報が揃っていれば登録可能" do
#       picture = build(:picture)
#       picture.valid?
#       expect(picture).to be_valid
#     end

#     it "imegeが無ければ無効" do
#       picture = build(:picture, image: "")
#       picture.valid?
#       expect(picture.errors[:image]).to include("can't be blank")
#     end

#     it "item_idが無ければ無効" do
#       picture = build(:picture, item: nil)
#       expect(picture.valid?).to be false
#     end

#   end
# end