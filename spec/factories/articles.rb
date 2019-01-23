FactoryBot.define do
  factory :article do
    question { Faker::Lorem.paragraph(1) }
    answer { Faker::Lorem.paragraph(100) }
    trait :simple do
      question { "Question?" }
      answer { "Answer" }
    end
  end
end
