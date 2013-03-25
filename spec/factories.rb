FactoryGirl.define do
  #factory :user do
  #  name 'Seymore Butts'
  #  email 'sbutts@email.com'
  #  password 'password'
  #  password_confirmation 'password'
  #end
  factory :user do
    name 'Example User'
    email 'user@example.com'
    password 'foobar'
    password_confirmation 'foobar'
  end
end