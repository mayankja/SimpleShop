FactoryBot.define do
  factory :user do
    password {'123456'}
    password_confirmation {'123456'}
    email {'swati@yopmail.com'}
    is_admin {false}
    f_name { "swati" }
    l_name  { "swati" }
  end
end