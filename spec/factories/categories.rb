FactoryBot.define do
  factory :category do
    description { FFaker::Company.name }
  end
end
