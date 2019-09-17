require 'rails_helper'
describe Shipping do
  before do
    @user = FactoryBot.create(:user)    
  end
  describe "#create" do
    it "全ての情報が揃っていれば登録可能" do
      shipping = build(:shipping, user: @user)
      shipping.valid?
      expect(shipping).to be_valid
    end

    it "zipcodeがなければ無効" do
      shipping = build(:shipping, zipcode: "", user: @user)
      shipping.valid?
      expect(shipping.errors[:zipcode]).to include("can't be blank")
    end

    it "prefがなければ無効" do
      shipping = build(:shipping, pref: "", user: @user)
      shipping.valid?
      expect(shipping.errors[:pref]).to include("can't be blank")
    end

    it "cityがなければ無効" do
      shipping = build(:shipping, city: "", user: @user)
      shipping.valid?
      expect(shipping.errors[:city]).to include("can't be blank")
    end

    it "addressがなければ無効" do
      shipping = build(:shipping, address: "", user: @user)
      shipping.valid?
      expect(shipping.errors[:address]).to include("can't be blank")
    end

    it "buildingがなくても有効" do
      shipping = build(:shipping, building: "", user: @user)
      shipping.valid?
      expect(shipping).to be_valid
    end

    it "phoneがなくても有効" do
      shipping = build(:shipping, phone: "", user: @user)
      shipping.valid?
      expect(shipping).to be_valid
    end

    it "user_idがなければ無効" do
      shipping = build(:shipping, user: nil)
      shipping.valid?
      expect(shipping.errors[:user_id]).to include("can't be blank")
    end

    it "defaultがなくても有効" do
      shipping = build(:shipping, default: "", user: @user)
      shipping.valid?
      expect(shipping).to be_valid
    end

    
  end
end