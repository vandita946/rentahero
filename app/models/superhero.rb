class Superhero < ApplicationRecord
  belongs_to :user
  validates :name, :superpower, :description, :price, presence: true
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
end
