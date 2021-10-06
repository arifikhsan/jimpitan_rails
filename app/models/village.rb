class Village < ApplicationRecord
  has_many :families
  has_many :village_managers
  has_many :village_donations
  has_many :patrol_members

  alias_attribute :managers, :village_managers

  def ready_to_print
    patrol_members.present? and village_donations.present?
  end
end
