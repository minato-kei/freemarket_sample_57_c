FactoryBot.define do
  factory :picture do
    image                   {Rack::Test::UploadedFile.new(Rails.root.join("#{Rails.root}/app/assets/images/card.png"), 'image/png') }
  end
end
