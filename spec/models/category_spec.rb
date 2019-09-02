require 'rails-helper'
describe Category do
  describe "#create" do
    it "全ての情報が揃っていれば登録可能"
      category = build(:cateogry)
      category.valid?
      expect(category).to be_valid
    end

    it "nameが無ければ無効"
      category = build(:cateogry, name: "")
      category.valid?
      expect(category.errors[:name]).to include("can't be blank")
    end

    it "ancestoryが無くても有効"
      category = build(:cateogry, ancestry: "")
      category.valid?
      expect(category).to be_valid
    end

  end
end