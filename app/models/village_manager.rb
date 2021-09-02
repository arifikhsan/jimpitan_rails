class VillageManager < ApplicationRecord
  belongs_to :village
  belongs_to :user

  alias_attribute :manager, :user
end
