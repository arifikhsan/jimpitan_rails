class PatrolMember < ApplicationRecord
  belongs_to :village
  belongs_to :user

  enum day_in_week: [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday]
end
