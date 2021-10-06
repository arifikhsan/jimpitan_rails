class VillageDonation < ApplicationRecord
  belongs_to :village

  enum content: [:empty, :money, :rice, :other]
end
