class UserValidator < ActiveModel::Validator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end

  def validate(record)
    # phone_numberは別ページのため抜いてます。
    items = [record.nickname, record.email, record.password, record.last_name_kanji, record.first_name_kanji, record.last_name_kana, record.first_name_kana, record.birthday]
    return if items.any?(:present?)
    record.errors[:base] << '入力漏れがあります'
  end
end