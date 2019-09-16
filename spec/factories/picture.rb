FactoryBot.define do
  factory :picture do
    id                      {99}
    image                   {Rack::Test::UploadedFile.new(Rails.root.join('spec/support/mercari_logo.png'), 'image/png') }
    item                    {FactoryBot.build :item}
  end
end