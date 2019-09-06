# require 'rails_helper'
# describe User do
#   describe "#create" do
#     it "全ての情報が揃っていれば登録可能" do
#       user = build(:user)
#       user.valid?
#       expect(user).to be_valid
#     end

#     it "nicknameがなければ無効" do
#       user = build(:user, nickname: "")
#       user.valid?
#       expect(user.errors[:nickname]).to include("can't be blank")
#     end

#     it "emailがなければ無効" do
#       user = build(:user, email: "")
#       user.valid?
#       expect(user.errors[:email]).to include("can't be blank")
#     end

#     it "passwordがなければ無効" do
#       user = build(:user, password: "")
#       user.valid?
#       expect(user.errors[:password]).to include("can't be blank")
#     end

#     it "passwordが短すぎると無効←このバリデーションあったかな？" do
#       user = build(:user, password: "0000000", password_confirmation: "00000000")
#       user.valid?
#       expect(user.errors[:password]).to include("can't be blank")
#     end

#     it "password_confirmationがなければ無効" do
#       user = build(:user, password_confirmation: "")
#       user.valid?
#       expect(user.errors[:password_confirmation]).to include("doesn't match Password")
#     end

#     it "passwordとpassword_confirmationが違うと無効" do
#       user = build(:user, password_confirmation: "11111111")
#       user.valid?
#       expect(user.errors[:password_confirmation]).to include("doesn't match Password")
#     end

#     it "last_name_kanjiがなければ無効" do
#       user = build(:user, last_name_kanji: "")
#       user.valid?
#       expect(user.errors[:last_name_kanji]).to include("can't be blank")
#     end

#     it "first_name_kanjiがなければ無効" do
#       user = build(:user, first_name_kanji: "")
#       user.valid?
#       expect(user.errors[:first_name_kanji]).to include("can't be blank")
#     end

#     it "last_name_kanaがなければ無効" do
#       user = build(:user, last_name_kana: "")
#       user.valid?
#       expect(user.errors[:last_name_kana]).to include("can't be blank")
#     end

#     it "first_name_kanaがなければ無効" do
#       user = build(:user, first_name_kana: "")
#       user.valid?
#       expect(user.errors[:first_name_kana]).to include("can't be blank")
#     end

#     it "birthdayがなければ無効" do
#       user = build(:user, birthday: "")
#       user.valid?
#       expect(user.errors[:birthday]).to include("can't be blank")
#     end

#     it "sexがなくても有効" do
#       user = build(:user, sex: "")
#       user.valid?
#       expect(user).to be_valid
#     end

    
#   end
# end
  