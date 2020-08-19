class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :board_games
  has_many :renter, class_name: "Renting"
  has_many :rentings, through: :board_games
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
