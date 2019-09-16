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
      expect(item.errors[:name]).to include("can't be blank")
    end

        it "priceがなければ無効" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "size_idがなくても有効" do
      item = build(:item, size_id: nil)
      expect(item).to be_valid
    end

    it "conditionがなければ無効" do
      item = build(:item, condition_id: "")
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

    it "cost_burdenがなくても有効" do
      item = build(:item, cost_burden_id: "")
      expect(item).to be_valid
    end

    it "shipping_fromがなければ無効" do
      item = build(:item, shipping_from: "")
      item.valid?
      expect(item.errors[:shipping_from]).to include("can't be blank")
    end

    it "shipping_day_idがなければ無効" do
      item = build(:item, shipping_day_id: "")
      item.valid?
      expect(item.errors[:shipping_day_id]).to include("can't be blank")
    end

    it "ratingがなくても有効" do
      item = build(:item, rating: "")
      expect(item).to be_valid
    end


    it "statusがなければ無効" do
      item = build(:item, status_id: "")
      item.valid?
      expect(item.errors[:status_id]).to include("can't be blank")
    end

    # it "created_atがなければ無効" do
    #   item = build(:item, created_at: "")
    #   item.valid?
    #   expect(item.errors[:created_at]).to include("can't be blank")
    # end

    # it "updated_atがなければ無効" do
    #   item = build(:item, updated_at: "")
    #   item.valid?
    #   expect(item.errors[:updated_at]).to be false
    # end

    it "user_idがなければ無効" do
      item = build(:item, user: nil)      
      expect(item.valid?).to be false
    end

    it "category_idがなければ無効" do
      item = build(:item, category: nil)
      expect(item.valid?).to be false
    end

    it "shipping_idがなければ無効" do
      item = build(:item, shipping: nil)
      expect(item.valid?).to be false
    end
    
  end
end