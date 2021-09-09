class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :addresses, dependent: :nullify
  has_many :orders, dependent: :nullify
  #Callback
  after_create :assign_default_role
  accepts_nested_attributes_for :addresses

  def assign_default_role
    self.add_role(:customer) unless self.is_admin
    self.add_role(:admin) if self.is_admin
    self.add_role(:customer) if self.is_admin
  end

  def admin?
    has_role?(:admin)
  end

  def customer?
    has_role?(:customer)
  end

  def as_json(options = {})
    super(options).merge(roles: roles)
  end
end
