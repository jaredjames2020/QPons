class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

   has_many :offers
   has_many :companies
   accepts_nested_attributes_for :companies
   has_many :travels, through: :offers
   validates_presence_of :username, :password, :password_confirmation
   validates_uniqueness_of :username

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.username = auth.info.name
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.password_confirmation = Devise.friendly_token[0,20]
      user.save
    end
  end
end
