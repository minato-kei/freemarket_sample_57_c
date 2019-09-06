class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  # omniauthのコールバック時に呼ばれるメソッド
  
  has_many :shippings, dependent: :destroy
  has_many :items, dependent: :destroy
  # has_many :orders
  # has_many :credits, dependent: :destroy
  # has_many :likes, dependent: :destroy
  # has_many :searches, dependent: :destroy
  # has_many :follows, dependent: :destroy
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.nickname = auth.info.name 
      
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
  # def self.find_for_oauth(auth)
  #   user = User.where(uid: auth.uid, provider: auth.provider).first

  #   unless user
  #     user = User.create(
  #       uid: auth.uid,
  #       provider: auth.provider,
  #       email: auth.info.email,
  #       password: Devise.friendly_token[0, 20]
  #     )
  #   end
  #   user
  # end
end