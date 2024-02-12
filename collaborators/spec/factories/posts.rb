FactoryBot.define do
  factory :post do
    title { 'a' * 20 }
    content { 'a' * 20 }
    association :user, factory: :user_with_unique_email
    category
  end
end

FactoryBot.define do
  factory :user_with_unique_email, class: 'User' do
    email { Faker::Internet.unique.email }
    password { 'password' }
  end
end