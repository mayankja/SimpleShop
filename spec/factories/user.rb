FactoryBot.define do
  factory :user do
    password {'123456'}
    password_confirmation {'123456'}
    email {'test@yopmail.com'}
    is_admin {false}
    f_name { "test" }
    l_name  { "test" }
    is_admin {true}
  end
end