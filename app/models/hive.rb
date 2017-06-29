class Hive < ApplicationRecord
  has_many :children_hives, class_name: "Hive", foreign_key: "parent_id"

  belongs_to :parent_hive, class_name: "Hive", foreign_key: "parent_id", optional: true

  has_many :beekeeper_hives
  has_many :beekeepers, through: :beekeeper_hives
  has_many :logs
 

end
