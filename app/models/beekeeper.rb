class Beekeeper < ApplicationRecord
  has_secure_password
  has_many :hives
end
