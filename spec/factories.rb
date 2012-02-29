FactoryGirl.define do
  factory :user do
    sequence(:first_name)  { |n| "Person #{n}" }
    sequence(:last_name)   { |n| "Surname #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    
    factory :admin do
      admin true
    end
  end
end