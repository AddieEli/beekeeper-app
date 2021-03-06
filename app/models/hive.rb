class Hive < ApplicationRecord

  has_many :children_hives, class_name: "Hive", foreign_key: "parent_id"

  belongs_to :parent_hive, class_name: "Hive", foreign_key: "parent_id", optional: true

  has_many :beekeeper_hives
  has_many :beekeepers, through: :beekeeper_hives
  has_many :logs

  #Map/Foraging Information
  geocoded_by :full_street_address   
  after_validation :geocode          # auto-fetch coordinates
 
  def last_log
    if logs.any?
      logs.last.hive_general_status
    else
      "no logs yet!"
    end
  end

  def full_street_address
      [street, hive_city, hive_state].compact.join(', ')

  end
end
