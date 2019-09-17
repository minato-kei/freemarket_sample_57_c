class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :pictures, dependent: :destroy
  belongs_to :shipping
  belongs_to :user
  belongs_to :category 
  has_many :orders
  validates :name, :price,:condition_id, :category_id,:shipping_from, :shipping_day_id, :status_id, presence: true
  
  belongs_to_active_hash :size
  belongs_to_active_hash :condition
  belongs_to_active_hash :cost_burden
  belongs_to_active_hash :shipping_day
  
  belongs_to_active_hash :status
  # has_many :orders, dependent: :destroy
  # has_many :likes, dependent: :destroy
  
  scope :price, -> (min, max) { 
    if min.blank? && max.blank?
      all
    elsif  min.blank?
      where('price < ?', max.to_i) 
    elsif max.blank?
      where('price > ?', min.to_i) 
    else
      where('price between ? and ?', min.to_i, max.to_i)
    end}
  scope :search, -> (keyword){ where((["name LIKE ?"] * keyword.size).join(" AND "), *keyword.map{|w| "%#{w}%"}) }
end
