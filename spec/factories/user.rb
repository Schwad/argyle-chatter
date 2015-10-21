FactoryGirl.define do

  factory :user do
    email "myuser@gmail.com"
    is_admin false
  end

  factory :admin, :class => :user do
    email "helloall@gmail.com"
    is_admin true
  end
end
