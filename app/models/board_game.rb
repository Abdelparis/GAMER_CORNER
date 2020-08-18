class BoardGame < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :name, :address, presence: :true
end
