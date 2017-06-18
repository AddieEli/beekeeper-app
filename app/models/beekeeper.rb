class Beekeeper < ApplicationRecord
  has_secure_password
  has_many :beekeeper_hives
  has_many :hives, through: :beekeeper_hives

   
end
