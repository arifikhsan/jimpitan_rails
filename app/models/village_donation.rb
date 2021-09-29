class VillageDonation < ApplicationRecord
  belongs_to :village

  enum type: [:empty, :money, :rice, :other]
end
