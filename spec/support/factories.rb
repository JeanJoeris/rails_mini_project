FactoryGirl.define do
  factory :user do
    name "Steve"
    username "steve"
    password "123"
    password_confirmation "123"

    factory :admin_user do
      role 1
    end
  end
end
