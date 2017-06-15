class Hive < ApplicationRecord
  has_many :beekeeper_hives
  has_many :beekeepers, through: :beekeeper_hives
  has_many :logs

 def display_log
      logs.each do |log|
        log.hive_general_status
    end 
  end 
end
