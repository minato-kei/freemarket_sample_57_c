require 'rails_helper'
describe Item do
  describe "#create" do
    it "全ての情報が揃っていれば登録可能" do
      item = build(:item)
      item.valid?
      expect(item).to be_valid
    end

    it "nameがなければ無効" do
      item = build(:item, name: "")
      item.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "priceがなければ無効" do
      item = build(:item, price: "")
      item.valid?
      expect(user.errors[:price]).to include("can't be blank")
    end

    it "sizeがなくても有効" do
      item = build(:item, size: "")
      item.valid?
      expect(user).to be_valid
    end

    it "conditionがなければ無効" do
      item = build(:item, condition: "")
      item.valid?
      expect(user.errors[:condition]).to include("can't be blank")
    end

    it "cost_burdenがなければ無効" do
      item = build(:item, cost_burden: "")
      item.valid?
      expect(user.errors[:cost_burden]).to include("can't be blank")
    end

    it "statusがなければ無効" do
      item = build(:item, status: "")
      item.valid?
      expect(user.errors[:status]).to include("can't be blank")
    end

    it "user_idがなければ無効" do
      item = build(:item, user_id: "")
      item.valid?
      expect(user.errors[:user_id]).to include("can't be blank")
    end

    it "category_idがなければ無効" do
      item = build(:item, category_id: "")
      item.valid?
      expect(user.errors[:category_id]).to include("can't be blank")
    end

    it "shipping_idがなければ無効" do
      item = build(:item, shipping_id: "")
      item.valid?
      expect(user.errors[:shipping_id]).to include("can't be blank")
    end
    
  end
end