FactoryGirl.define do
  sequence(:name) { |n| "name-#{n}" }
  sequence(:email) { |n| "email-#{n}@some-host.com" }
  sequence(:password) { |n| "password-#{n}" }
  sequence(:full_name) { |n| "Full name #{n}" }
  sequence(:date) { |n| n.minutes.since.to_date }
end
