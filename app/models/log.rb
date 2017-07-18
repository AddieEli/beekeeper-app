class Log < ApplicationRecord
  belongs_to :hive

  enum hive_general_status:["In Good Health", "Uncertain", "SOS"]
  enum queen: {"Yes" => 0, "No" => 1 }, _prefix: true
  enum larva: {"Yes" => 0, "No" => 1 }, _prefix: true
  enum comb_build: {"Yes" => 0, "No" => 1 }, _prefix: true
end
