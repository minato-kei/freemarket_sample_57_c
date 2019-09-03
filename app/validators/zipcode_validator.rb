class ZipcodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, 'は、数字3桁-4桁の形式、もしくは数字7桁で入力してください。') unless value =~ /\A[0-9]{3}-[0-9]{4}\z|\A[0-9]{7}\z/
  end
end