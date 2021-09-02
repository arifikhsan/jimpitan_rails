class User < ApplicationRecord
  has_one :user_detail

  alias_attribute :detail, :user_detail
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  enum role: [:admin, :user]
  after_initialize :set_default_role
  before_create :set_default_user_detail

  def set_default_role
    self.role ||= :user
  end

  def name
    detail.name
  end

  def set_default_user_detail
    if self.detail.nil?
      self.build_user_detail(name: "orang baru #{rand(1111...9999)}")
    end
  end
end
