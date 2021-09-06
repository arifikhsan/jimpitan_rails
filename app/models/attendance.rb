class Attendance < ApplicationRecord
  belongs_to :village
  belongs_to :user

  enum status: [:present, :sick, :permit, :alpha]
end
