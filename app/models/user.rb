class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :offers
  has_many :companies
  has_many :travels, through: :offers
  validates_presence_of :username, :password, :password_confirmation
  validates_uniqueness_of :username
  has_secure_password
end
