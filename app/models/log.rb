class Log < ApplicationRecord
  belongs_to :hive

  enum hive_general_status:["In Good Health", "Uncertain", "SOS"]

 
end
