FactoryBot.define do
  factory :costumer do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    gender { ["M", "F"].sample }
    address { FFaker::Address.street_address }

    transient do
      qtt_orders { 3 }
    end

    trait :male do
      gender { "M" }
    end

    trait :female do
      gender { "F" }
    end

    trait :vip do
      vip { true }
      days_to_pay { 30 }
    end

    trait :default do
      vip { false }
      days_to_pay { 10 }
    end

    trait :with_orders do
      after :create do |costumer, evaluator|
        create_list(:order, evaluator.qtt_orders, costumer: costumer) 
      end
    end

    factory :costumer_with_orders, traits: [:with_orders]
    factory :costumer_male, traits: [:male]
    factory :costumer_female, traits: [:female]
    factory :costumer_default, traits: [:default]
    factory :costumer_vip, traits: [:vip]
    factory :costumer_male_vip, traits: [:male, :vip]
    factory :costumer_female_vip, traits: [:female, :vip]
    factory :costumer_male_default, traits: [:male, :default]
    factory :costumer_female_default, traits: [:female, :default]
  end
end
