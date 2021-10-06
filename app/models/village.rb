class Village < ApplicationRecord
  has_many :families
  has_many :village_managers

  alias_attribute :managers, :village_managers
end
