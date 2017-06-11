class Hive < ApplicationRecord
  has_many :beekeepers
  has_many :logs
end
