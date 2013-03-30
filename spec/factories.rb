#FactoryGirl.define do
#  factory :user do
#    name 'User Name'
#    email 'user@email.com'
#    password 'password'
#    password_confirmation 'password'
#  end
#end

FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "User #{n}" }
    sequence(:email) { |n| "user#{n}@email.com"}
    password 'password'
    password_confirmation 'password'

    factory :admin do
      admin true
    end
  end

  factory :micropost do
    content 'Lorem ipsum'
    user
  end
end