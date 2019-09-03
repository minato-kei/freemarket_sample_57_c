class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shippings, dependent: :destroy
  has_many :items, dependent: :destroy
  # has_many :orders
  # has_many :credits, dependent: :destroy
  # has_many :likes, dependent: :destroy
  # has_many :searches, dependent: :destroy
  # has_many :follows, dependent: :destroy

  validates_with UserValidator
  validates :email, email: true
  validates :zipcode, zipcode: true
  
  
  
  
end
