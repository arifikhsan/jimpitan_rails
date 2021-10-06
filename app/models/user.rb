class User < ApplicationRecord
  has_one :user_detail
  has_many :village_managers
  has_many :patrol_members
  has_many :manage_villages, through: :village_managers, source: :village
  belongs_to :role

  alias_attribute :detail, :user_detail
  alias_attribute :managers, :village_managers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  after_initialize :set_default_role
  before_create :set_default_user_detail

  def set_default_role
    self.role_id ||= Role.guest.id
  end

  def name
    detail.name
  end

  def set_default_user_detail
    self.build_user_detail(name: "orang baru #{rand(1111...9999)}") if self.detail.nil?
  end

  def is_new
    managers.blank? and patrol_members.blank?
  end

  def is_manager
    role_id == Role.manager.id
  end

  def has_village_to_manage
    managers.present?
  end

  def manage_village
    manage_villages.first
  end
end
