class BoardGame < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :rentings
  validates :name, :address, presence: :true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
