require 'rails_helper'
describe Item do
  describe "#create" do
    before do
      @category = FactoryBot.create(:category)
      @user = FactoryBot.create(:user)
      @shipping = FactoryBot.create(:shipping)
    end

    it "全ての情報が揃っていれば登録可能" do
      item = build(:item, category: @category, user: @user, shipping: @shipping)
      item.valid?
      expect(item).to be_valid
    end

    it "nameがなければ無効" do
      item = build(:item, name: "", category: @category, user: @user, shipping: @shipping)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

        it "priceがなければ無効" do
      item = build(:item, price: "", category: @category, user: @user, shipping: @shipping)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "size_idがなくても有効" do
      item = build(:item, size_id: nil, category: @category, user: @user, shipping: @shipping)
      expect(item).to be_valid
    end

    it "conditionがなければ無効" do
      item = build(:item, condition_id: "", category: @category, user: @user, shipping: @shipping)
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

    it "cost_burdenがなくても有効" do
      item = build(:item, cost_burden_id: "", category: @category, user: @user, shipping: @shipping)
      expect(item).to be_valid
    end

    it "shipping_fromがなければ無効" do
      item = build(:item, shipping_from: "", category: @category, user: @user, shipping: @shipping)
      item.valid?
      expect(item.errors[:shipping_from]).to include("can't be blank")
    end

    it "shipping_day_idがなければ無効" do
      item = build(:item, shipping_day_id: "", category: @category, user: @user, shipping: @shipping)
      item.valid?
      expect(item.errors[:shipping_day_id]).to include("can't be blank")
    end

    it "ratingがなくても有効" do
      item = build(:item, rating: "", category: @category, user: @user, shipping: @shipping)
      expect(item).to be_valid
    end


    it "statusがなければ無効" do
      item = build(:item, status_id: "", category: @category, user: @user, shipping: @shipping)
      item.valid?
      expect(item.errors[:status_id]).to include("can't be blank")
    end

    it "user_idがなければ無効" do
      item = build(:item, user: nil, category: @category, shipping: @shipping)      
      expect(item.valid?).to be false
    end

    it "category_idがなければ無効" do
      item = build(:item, category: nil, user: @user, shipping: @shipping)
      expect(item.valid?).to be false
    end

    it "shipping_idがなければ無効" do
      item = build(:item, shipping: nil, category: @category, user: @user)
      expect(item.valid?).to be false
    end
    
  end
end