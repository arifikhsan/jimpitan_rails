class Role < ApplicationRecord
  has_many :users

  class << self
    %w[admin manager member guest].each do |name|
      define_method name do
        find_by(name: name)
      end
    end
  end
end
