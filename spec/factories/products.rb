FactoryBot.define do
  factory :product do
    description { FFaker::Company.name }
    price { FFaker::Random.seed }
    category 
  end
end
