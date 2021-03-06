# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create(:name => "Action")
Genre.create(:name => "Animated")
Genre.create(:name => "Comedy")
Genre.create(:name => "Drama")
Genre.create(:name => "Horror")
Genre.create(:name => "Psychological Thriller")
Genre.create(:name => "Romantic Comedy")

40.times do
  Actor.create(:first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name)
end

10.times do
  User.create(:username => Faker::Name.unique.name, :email => Faker::Internet.unique.email, :password => "password")
end

20.times do
  movie = Movie.create(:title => Faker::Book.unique.title, :synopsis => Faker::Lorem.paragraph(sentence_count: 4, supplemental: false, random_sentences_to_add: 2), :year => Faker::Number.between(from: 1950, to: 2019), :user_id => rand(1...User.count))

  2.times { movie.genres << Genre.find(Faker::Number.between(from: 1, to: 7)) }
  5.times { movie.actors << Actor.find(Faker::Number.between(from: 1, to: 40)) }
end

60.times do
  Review.create(:user_id => rand(1...User.count), :movie_id => rand(1...Movie.count), :title => Faker::Movies::HarryPotter.quote, :content => Faker::Lorem.paragraph(sentence_count: 10, supplemental: false, random_sentences_to_add: 4), :rating => rand(1...5))
end
