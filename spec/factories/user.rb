FactoryGirl.define do

  factory :user do
    email "myuser@gmail.com"
    password "herokubokudoku"
    is_admin false
  end

  factory :admin, :class => :user do
    email "helloall@gmail.com"
    password "shhiamasecretadmin"
    is_admin true
  end
end
