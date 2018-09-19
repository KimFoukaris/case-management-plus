class User < ActiveRecord::Base
  has_secure_password

  has_many :updates
  has_many :beneficiaries, through: :updates

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  
end
