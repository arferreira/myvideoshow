FactoryBot.define do
    factory :video do
      name         { FFaker::Lorem.word }
      description  { FFaker::Lorem.sentence }
      url          { FFaker::Internet.http_url }
      user
    end
   end