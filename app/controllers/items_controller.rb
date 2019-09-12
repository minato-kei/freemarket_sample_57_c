class ItemsController < ApplicationController
  before_action :still_selling?, only: [:purchase_confirmation, :purchase]
  before_action :set_item, only: [:edit, :destroy, :show, :update,:purchase_confirmation, :purchase]
  before_action :user_signed_in?, only: [:new, :edit, :destroy, :show, :update,:purchase_confirmation, :purchase]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update, :purchase_confirmation, :purchase, :purchase_complete]

  def index
    if user_signed_in?
      @items = Item.where.not(user_id: current_user.id).last(10)
    else
      @items = Item.all.last(10)
    end
  end

  def show
    @item = Item.find(params[:id])
    if user_signed_in?
      @items = Item.where.not(user_id: current_user.id).last(10)
    else
      @items = Item.all.last(10)
    end
    @big_categories = Category.where(ancestry: nil)
  end

  def edit
    @user = current_user
    @pictures = @item.pictures
    @big_categories = Category.where(ancestry: nil)
    @item_category = @item.category
  end
  
  def new
    @big_categories = Category.where(ancestry: nil).where.not(name: "カテゴリ一覧" )
    @middle_categories = Category.where(ancestry: params[:big_category]) if params[:big_category]
    @small_categories = Category.where(ancestry: params[:middle_category]) if params[:middle_category]
    @item = Item.new
    respond_to do |format|
      format.json
      format.html
    end
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
          render action: :new
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

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      if params[:item][:image] != nil
        params[:item][:image]&.take(10-@item.pictures.length).each do |image|
          @picture = Picture.new(image: image, item_id: @item.id)
          unless @picture.save
            render action: :new
          end
        end
      end
      unless params[:delete].blank?
        d = params[:delete].split(",").map{|i| i.to_i}
        d.sort!{|a,b| b<=>a}
        d.each do |i|
          @item.pictures[i].destroy
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
  
  def destroy
    if @item.user.id == current_user.id
      @item.destroy
      redirect_to profile_user_path(current_user)
    else
      redirect_to root_path
    end
  end
  
  def purchase_confirmation
    @category = @item.category
    @user = current_user
    create_token(@user)
    @shipping = @user.shippings.first
    @shipping_pref = Prefecture.find_by(id: @shipping.pref)
    @customer = Payjp::Customer.retrieve(@credit.token)
  end
  
  def purchase
    @category = @item.category
    #購入ユーザーを仮で作成
    @user = current_user
    create_token(@user)
    if Payjp::Charge.create(amount: @item.price,customer: @credit.token,currency: 'jpy')
      @user.balance -= @item.price
      @user.update(balance: @user.balance)
      @item.update(status_id: 2)
      @order = Order.create(item_id: @item.id, purchase_user_id: @user.id, item_status: @item.status_id)
      redirect_to purchase_complete_item_path
    else
      redirect_to purchase_confirmation_item_path
    end
    
  end

  def purchase_complete
  end

  def search
    @prices = Price.all
    @conditions = Condition.all
    @keyword = params[:keyword].to_s.split(/[[:blank:]]+/)
    @items = Item.price( params[:min_price], params[:max_price]).search(@keyword).where(search_params).page(params[:page]).per(4)
    if @items.blank?
      @items = Item.page(params[:page]).per(2)
      @count=0
    end
  end

  def category
    @category = Category.find(params[:category_id])
    @items = Item.all.limit(10)
  end
  
  private
  
  def create_token(user)
    Payjp.api_key = Rails.application.credentials.dig(:payment_secret_key)
    @credit = user.credits.first
  end

  def still_selling?
    @item = Item.find(params[:id])
    if @item.status_id != 1
      redirect_to root_path
    end
  end

  def item_params
    shipping = Shipping.find_by(user_id: current_user.id)
    params.require(:item).permit(:name,:text, :size_id,:condition_id, :cost_burden_id, :shipping_from, :shipping_day_id, :rating, :status_id, :category_id).merge(price: params[:price],user_id: current_user.id, shipping_id: shipping.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def search_params
    params.permit(:category_id, :brand_id, :size_id, :condition_id, :cost_burden, :status_id).reject{|k,v| v.blank?}
  end
end
