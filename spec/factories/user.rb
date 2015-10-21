FactoryGirl.define do

  factory :user do
    email "myuser@gmail.com"
    password "mypassword"
    is_admin false
  end
end
