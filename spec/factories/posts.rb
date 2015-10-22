# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "MyTextnessyo"
    body "MyText"
    user_id 1

    factory :invalid_post do
      user_id nil
    end
  end
end
