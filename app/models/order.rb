class Order < ApplicationRecord
validates :item_id, :purchase_user_id,  presence: true
belongs_to :item, optional:true 
end
