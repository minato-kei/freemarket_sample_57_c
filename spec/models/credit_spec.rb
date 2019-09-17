require 'rails_helper'
require 'payjp'
describe Credit do
  describe "#create" do
    it "全ての情報が揃っていれば登録可能" do
      credit = build(:credit)
      expect(credit).to be_valid
    end
    
    it "tokenが無ければ無効" do
      credit = build(:credit, token: "")
      credit.valid?
      expect(credit.errors[:token]).to include("can't be blank")
    end

    it "user_idが無ければ無効" do
      credit = build(:credit, user_id: "")
      credit.valid?
      expect(credit.errors[:user]).to include("must exist")
    end

  end
end