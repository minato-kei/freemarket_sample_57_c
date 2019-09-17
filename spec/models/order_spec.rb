require 'rails_helper'
describe Order do
  before do
    @category = FactoryBot.create(:category)
    @user = FactoryBot.create(:user)
    @shipping = FactoryBot.create(:shipping)
    @shipping = @user.shippings.create(FactoryBot.attributes_for(:shipping, user: @user))
    @item = @user.items.create(FactoryBot.attributes_for(:item, category: @category, shipping: @user.shippings.first))      
    @item.pictures.create(FactoryBot.attributes_for(:picture))  
  end
  describe "#create" do
    it "全ての情報が揃っていれば登録可能" do
      order = build(:order, purchase_user_id: @user.id, item: @item)
      order.valid?
      expect(order).to be_valid
    end

    it "item_idがなければ無効" do
      order = build(:order, item: nil, purchase_user_id: @user.id)
      expect(order.valid?).to be false
    end

    it "purchase_user_idがなければ無効" do
      order = build(:order, purchase_user_id: "", item: @item)
      order.valid?
      expect(order.errors[:purchase_user_id]).to include("can't be blank")
    end

    it "deal_atがなくても有効" do
      order = build(:order, deal_at: "", purchase_user_id: @user.id, item: @item)
      order.valid?
      expect(order).to be_valid
    end

    it "cancelがなくても有効" do
      order = build(:order, cancel: "", purchase_user_id: @user.id, item: @item)
      order.valid?
      expect(order).to be_valid
    end

    it "item_statusがなくても有効" do
      order = build(:order, item_status: "", purchase_user_id: @user.id, item: @item)
      order.valid?
      expect(order).to be_valid
    end
  end
end