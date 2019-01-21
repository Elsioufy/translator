FactoryBot.define do
  factory :article do
    question { Faker::Lorem.paragraph(1) }
    answer { Faker::Lorem.paragraphs(30) }
  end
end
