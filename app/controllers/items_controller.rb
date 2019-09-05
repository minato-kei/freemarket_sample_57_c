class ItemsController < ApplicationController

  def index
    @items = Item.all.last(10)
    @picture = Picture.first
    @big_categories = Category.where(ancestry: nil)
    @ladies_items = Category.where(name: "レディース")[0].items.last(4)
    @mens_items = Category.where(name: "メンズ")[0].items.last(4)
    @babies_items = Category.where(name: "ベビー・キッズ")[0].items.last(4)
    @makeup_items = Category.where(name: "コスメ・香水・美容")[0].items.last(4) 
    #pickupブランドを4ブランド x4 itemsで作成
  end

  def show
    @items = Item.all.last(10)
    @item = Item.find(params[:id])
    @big_categories = Category.where(ancestry: nil)
  end
  
  def new
    @categories = Category.where(ancestry: nil)
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      unless params[:delete].blank?
        d = params[:delete].split(",").map{|i| i.to_i}
        d.sort!{|a,b| b<=>a}
        d.each do |i|
          params[:item][:image].delete_at(i)
        end
      end
      params[:item][:image].take(10).each do |image|
        @picture = Picture.new(image: image, item_id: @item.id)
        unless @picture.save
          redirect_to new_item_path
        end
      end
      respond_to do |format|
        format.html
      end
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  private
  def item_params
    current_user = User.find(1)
    shipping = Shipping.find_by(user_id: current_user.id)
    params.require(:item).permit(:name,:price, :size,:condition, :cost_burden, :shipping_from, :shipping_day, :rating, :status, :category_id).merge(user_id: current_user.id, shipping_id: shipping.id)
  end

end
