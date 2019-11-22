# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create({
  email: 'mischkez987@gmail.com',
  username: 'mischkez',
  password: 'jasam2203',
  password_confirmation: 'jasam2203'
})

20.times do
  User.create({
    email: Faker::Internet.unique.email,
    username: Faker::Internet.unique.username,
    password: 'secret',
    password_confirmation: 'secret'
  })
end

10.times do
  title = Faker::Lorem.word

  Category.create({
    title: title,
    slug: title.parameterize,
  })
end

50.times do
  title = Faker::Lorem.sentence

  Question.create({
    category: Category.order('RAND()').first,
    user_id: User.order('RAND()').first.id,
    title: title,
    slug: title.parameterize,
    body: Faker::Lorem.paragraph,
  })
end

50.times do
  Reply.create({
    user_id: User.order('RAND()').first.id,
    question: Question.order('RAND()').first,
    body: Faker::Lorem.paragraph,
  })
end