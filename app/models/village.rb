class Village < ApplicationRecord
  has_many :families
  has_many :village_managers
  has_many :village_donations

  alias_attribute :managers, :village_managers
end
