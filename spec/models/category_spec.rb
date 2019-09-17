require 'rails_helper'
describe Category do
  describe "#create" do

    it "全ての情報が揃っていれば登録可能" do
      category = build(:category)
      category.valid?
      expect(category).to be_valid
    end

    it "nameが無ければ無効" do
      category = build(:category, name: "")
      category.valid?
      expect(category.errors[:name]).to include("can't be blank")
    end

    it "ancestoryが無くても有効" do
      category = build(:category, ancestry: nil)
      category.valid?
      expect(category).to be_valid
    end

  end
end