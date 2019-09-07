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
    @item = Item.new
  end

  def purchase_confirmation
    Payjp.api_key = Rails.application.credentials.dig(:payment_secret_key)
    @item = Item.find(params[:id])
    @category = @item.category
    @user = User.find(1)
    @shipping = @user.shippings.first
    @shipping_pref = Prefecture.find_by(id: @shipping.pref)
    @credit = @user.credits.first
    @customer = Payjp::Customer.retrieve(@credit.token)
  end

  def purchase
    Payjp.api_key = Rails.application.credentials.dig(:payment_secret_key)
    @item = Item.find(params[:id])
    @category = @item.category
    @user = User.find(1) 
    @credit = @user.credits.first
    if Payjp::Charge.create(:amount => @item.price,:customer => @credit.token,:currency => 'jpy')
      @user.balance -= @item.price
      @user.update(balance: @user.balance)
      redirect_to purchase_complete_item_path
    else
      redirect_to purchase_confirmation_item_path
    end

  end

  def purchase_complete
  end
end
