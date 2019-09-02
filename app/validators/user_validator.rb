class UserValidator < ActiveModel::Validator
  def validate(record)
    items = [record.nickname, record.email, record.password, record.last_name_kanji, record.first_name_kanji, record.last_name_kana, record.first_name_kana, record.phone_number, record.birthday]
    return if items.any?(:present?)
    record.errors[:base] << '入力漏れがあります'
  end
end