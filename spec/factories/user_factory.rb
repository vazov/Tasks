FactoryGirl.define do
  sequence(:email) {|n| "user#{n + 1}@example.com" }
  sequence(:first_name) {|n| "user#{n + 1}" }

  factory :user do
    first_name 
    email
    password "hunter2"
    password_confirmation "hunter2"

    factory :admin_user do
      admin true
    end
  end
end
