class Hive < ApplicationRecord
  has_many :beekeeper_hives
  has_many :beekeepers, through: :beekeeper_hives
  has_many :logs
 

end
