class BoardGame < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :rentings
  validates :name, :address, presence: :true
end
