FactoryBot.define do
  factory :user do
    name { "User" }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :admin, class: 'User' do
    name { "Admin" }
    email { "test@admin.com" }
    password { "qwerty" }
    admin { true }
  end
end
