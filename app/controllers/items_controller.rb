class ItemsController < ApplicationController

  def index
    @items = Item.all.last(10)
    @picture = Picture.first
    #上はアソシエーション組んでいないので、仮おき
    @ladies_items = Category.where(name: "レディース")[0].items.last(4)
    @mens_items = Category.where(name: "メンズ")[0].items.last(4)
    @babies_items = Category.where(name: "ベビー・キッズ")[0].items.last(4)
    @makeup_items = Category.where(name: "コスメ・香水・美容")[0].items.last(4)
    #pickupブランドを4ブランド x4 itemsで作成
  end

  def show
  end
  
end
