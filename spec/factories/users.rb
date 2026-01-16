FactoryBot.define do
  factory :user do
    name { "Michael Example" }
    email { "michael@example.com" }
    password { "password" }
    password_confirmation { "password" }
    admin { true }

    factory :archer do
      name { "Sterling Archer" }
      email { "duchess@example.gov" }
      admin { false }
    end
  end

  factory :continuous_users, class: User do
    sequence(:name) { |n| "User#{n}" }
    sequence(:email) { |n| "user-#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end


