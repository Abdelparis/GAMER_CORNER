# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require 'faker'

Renting.destroy_all
BoardGame.destroy_all
User.destroy_all

# users = User.create([{ password: "123456", email: "owner@gmail.com" }, { password: "123456", email: "renter@gmail.com" }])

user_1 = User.create(password: "123456", email: "owner@gmail.com")
user_2 = User.create( password: "123456", email: "renter@gmail.com")

file_1 = URI.open('https://www.leberetfrancais.com/4914-large_default/beret-classique-chasseur-homme.jpg')
user_1.photo.attach(io: file_1, filename: 'nes.png', content_type: 'image/png')
file_2 = URI.open('https://www.leberetfrancais.com/4906-large_default/beret-mode-noir-femme.jpg')
user_2.photo.attach(io: file_2, filename: 'nes.png', content_type: 'image/png')


puts 'Creating 3 fake board games...'

  monopoly = BoardGame.new(
    name: "Monopoly",
    description: "Objectif : être le joueur le plus riche à la fin de la partie, lorsque les autres joueurs ont fait faillite. Pour cela n'hésitez pas à acheter, vendre, construire et spéculer !",
    comment: "J'adore ce jeu !",
    address: "10 rue Nollet Paris",
    available: true,
    user_id: User.minimum(:id)
  )
  file = URI.open('https://images-na.ssl-images-amazon.com/images/I/91MhR-u3-hL._AC_SL1500_.jpg')

  monopoly.photo.attach(io: file, filename: 'monopoly.png', content_type: 'image/jpg')

  monopoly.save!


  azul = BoardGame.new(
    name: "Azul",
    description: "Prenez votre truelle et faites ressortir vos talents d'artisan. Constituez la plus belle mosaïque",
    comment: "Meilleur jeu, je KIFFE",
    address: "rue Oberkampf, Paris",
    available: false,
    user_id: User.minimum(:id)
  )

  file = URI.open('https://cdn2.philibertnet.com/402193-thickbox_default/azul.jpg')

  azul.photo.attach(io: file, filename: 'azul.png', content_type: 'image/jpg')
  azul.save!

 seven_wonders = BoardGame.new(
    name: "Seven Wonders",
    description: "Dans 7 Wonders, prenez la tête de l'une des sept grandes cités du monde antique et laissez votre empreinte dans l'histoire des civilisations",
    comment: "Super pour jouer entre Amis",
    address: "4 place de clichy",
    available: true,
    user_id: User.minimum(:id)
  )

  file = URI.open('https://alloescape.fr/wp-content/uploads/2018/05/7-wonders-vf.jpg')

  seven_wonders.photo.attach(io: file, filename: 'seven_wonders.png', content_type: 'image/jpg')
  seven_wonders.save!

  scrabble =  BoardGame.new(
    name: "Scrabble",
    description: "Le Scrabble est un jeu de société et un jeu de lettres où l'objectif est de cumuler des points, sur la base de tirages aléatoires de lettres, en créant des mots sur une grille carrée, dont certaines cases sont primées",
    comment: "Super pour jouer entre Amis",
    address: "20 avenue de clichy",
    available: true,
    user_id: User.minimum(:id)
  )

  file = URI.open('https://images-na.ssl-images-amazon.com/images/I/81ghItchj1L._AC_SX355_.jpg')

  scrabble.photo.attach(io: file, filename: 'scrabble.png', content_type: 'image/jpg')
  scrabble.save!


rentings = Renting.create(
  starting_date: Faker::Date.between(from: 2.days.ago, to: 1.days.ago),
  ending_date: Faker::Date.between(from: Date.today, to: Date.today),
  review_content: Faker::Lorem.sentence(word_count: 15),
  review_rating: 3,
  status: "rejected",
  board_game_id: BoardGame.minimum(:id),
  user_id: User.maximum(:id)
  )


rentings = Renting.create(
  starting_date: Faker::Date.between(from: 2.days.ago, to: 1.days.ago),
  ending_date: Faker::Date.between(from: Date.today, to: Date.today),
  review_content: Faker::Lorem.sentence(word_count: 15),
  review_rating: 3,
  status: "pending",
  board_game_id: BoardGame.maximum(:id)-1,
  user_id: User.maximum(:id)
  )

rentings = Renting.create(
  starting_date: Faker::Date.between(from: 2.days.ago, to: 1.days.ago),
  ending_date: Faker::Date.between(from: Date.today, to: Date.today),
  review_content: Faker::Lorem.sentence(word_count: 15),
  review_rating: 3,
  status: "validated",
  board_game_id: BoardGame.maximum(:id),
  user_id: User.maximum(:id)
  )


puts 'Finished!'
