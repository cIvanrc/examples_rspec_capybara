FactoryBot.define do
  factory :member do
    email { FFaker::Internet.email }    
    password { 'foobar' }
    password_confirmation { 'foobar' }
  end
end
