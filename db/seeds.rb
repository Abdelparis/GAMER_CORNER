# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Renting.destroy_all
BoardGame.destroy_all
User.destroy_all

users = User.create([{ password: "123456", email: "owner@gmail.com" }, { password: "123456", email: "renter@gmail.com" }])


puts 'Creating 3 fake board games...'
3.times do
  board_game = BoardGame.new(
    name:    Faker::Game.title,
    description: Faker::Lorem.sentence(word_count: 30),
    comment: Faker::Lorem.sentence(word_count: 15),
    address: Faker::Address.street_address,
    available: Faker::Boolean.boolean,
    user_id: User.minimum(:id)
  )
  board_game.save!
end

rentings = Renting.create(
  starting_date: Faker::Date.between(from: 2.days.ago, to: 1.days.ago),
  ending_date: Faker::Date.between(from: Date.today, to: Date.today),
  review_content: Faker::Lorem.sentence(word_count: 15),
  review_rating: 3,
  status: "pending",
  board_game_id: BoardGame.maximum(:id),
  user_id: User.maximum(:id)
  )


rentings = Renting.create(
  starting_date: Faker::Date.between(from: 2.days.ago, to: 1.days.ago),
  ending_date: Faker::Date.between(from: Date.today, to: Date.today),
  review_content: Faker::Lorem.sentence(word_count: 15),
  review_rating: 3,
  status: "pending",
  board_game_id: BoardGame.maximum(:id),
  user_id: User.maximum(:id)
  )

rentings = Renting.create(
  starting_date: Faker::Date.between(from: 2.days.ago, to: 1.days.ago),
  ending_date: Faker::Date.between(from: Date.today, to: Date.today),
  review_content: Faker::Lorem.sentence(word_count: 15),
  review_rating: 3,
  status: "pending",
  board_game_id: BoardGame.minimum(:id),
  user_id: User.maximum(:id)
  )


puts 'Finished!'
