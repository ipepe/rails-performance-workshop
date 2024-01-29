class Shelter < ApplicationRecord
  geocoded_by :address

  has_many :pets

  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
