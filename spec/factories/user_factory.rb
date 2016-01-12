FactoryGirl.define do
  factory :user do
    email
    password
    full_name
  end

  factory :registration_user_type do
    email
    password
    password_confirmation { password }
    full_name
  end
end
