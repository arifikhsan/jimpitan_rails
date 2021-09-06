class Donation < ApplicationRecord
  belongs_to :village
  belongs_to :family

  enum content: [:money, :rice, :empty]
end
