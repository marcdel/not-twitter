namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    admin = User.create!(name: 'Admin User',
                         email: 'admin@email.com',
                         password: 'password',
                         password_confirmation: 'password')
    admin.toggle!(:admin)

    User.create!(name: 'Fake User',
                 email: 'user@email.com',
                 password: 'password',
                 password_confirmation: 'password')

    99.times do |n|
      name  = Faker::Name.name
      email = "user#{n+1}@email.com"
      password  = 'password'
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 10)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end
end