class Donation < ApplicationRecord
  belongs_to :village
  belongs_to :family
  belongs_to :patrol_member
  belongs_to :village_donation
end
