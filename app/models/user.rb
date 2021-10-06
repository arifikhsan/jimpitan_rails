class User < ApplicationRecord
  has_one :user_detail
  has_many :village_managers
  has_many :patrol_members
  has_many :manage_villages, through: :village_managers, source: :village

  alias_attribute :detail, :user_detail
  alias_attribute :managers, :village_managers

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

  def is_new
    managers.blank? and patrol_members.blank?
  end

  def is_manager
    managers.present?
  end
end
