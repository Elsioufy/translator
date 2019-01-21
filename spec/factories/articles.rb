FactoryBot.define do
  factory :article do
    title { Faker::Lorem.paragraph(1) }
    body { Faker::Lorem.paragraphs(30) }
  end
end
