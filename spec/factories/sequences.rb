FactoryGirl.define do
  sequence(:email) { |n| "email-#{n}@some-host.com" }
  sequence(:password) { |n| "password-#{n}" }
  sequence(:full_name) { |n| "Full name #{n}" }
end
