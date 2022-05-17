FactoryBot.define do
  factory :customer do
    user_type { 1 }
    full_name { "MyString" }
    phone_number { "MyString" }
    email { "MyString" }
  end
end
