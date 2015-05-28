require_relative '../app/models/user.rb'

100.times do |x|
  User.create(email: Faker::Internet.email, password: Faker::Internet.password(3))
end