class ItemsController < ApplicationController
  before_action :still_selling?, only: [:purchase_confirmation, :purchase]

  def index
    @items = Item.all.last(10)
    @picture = Picture.first
    @big_categories = Category.where(ancestry: nil)
    @ladies_items = Category.where(name: "レディース")[0].items.last(4)
    @mens_items = Category.where(name: "メンズ")[0].items.last(4)
    @babies_items = Category.where(name: "ベビー・キッズ")[0].items.last(4)
    @makeup_items = Category.where(name: "コスメ・香水・美容")[0].items.last(4) 
  end

  def show
    @items = Item.all.last(10)
    @item = Item.find(params[:id])
    @big_categories = Category.where(ancestry: nil)
  end

  def edit
    @user = User.find(10)
    #ユーザー仮置き
    #@user = current_user
    @item = @user.items.find_by(id: params[:id])
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

  def purchase_confirmation
    @item = Item.find(params[:id])
    @category = @item.category
    @user = User.find(10)
    create_token(@user)
    @shipping = @user.shippings.first
    @shipping_pref = Prefecture.find_by(id: @shipping.pref)
    @customer = Payjp::Customer.retrieve(@credit.token)
  end

  def purchase
    @item = Item.find(params[:id])
    @category = @item.category
    #購入ユーザーを仮で作成
    @user = User.find(10)
    create_token(@user)
    if Payjp::Charge.create(amount: @item.price,customer: @credit.token,currency: 'jpy')
      @user.balance -= @item.price
      @user.update(balance: @user.balance)
      @item.update(status: "取引中")
      @order = Order.create(item_id: @item.id, purchase_user_id: @user.id, item_status: @item.status)
      redirect_to purchase_complete_item_path
    else
      redirect_to purchase_confirmation_item_path
    end

  end

  def purchase_complete
  end

  private

  def create_token(user)
    Payjp.api_key = Rails.application.credentials.dig(:payment_secret_key)
    @credit = user.credits.first
  end

  def still_selling?
    @item = Item.find(params[:id])
    if @item.status != "出品中"
      redirect_to root_path
    end
  end

  def item_params
    current_user = User.find(1)
    shipping = Shipping.find_by(user_id: current_user.id)
    params.require(:item).permit(:name, :size,:condition, :cost_burden, :shipping_from, :shipping_day, :rating, :status, :category_id).merge(price: params[:price],user_id: current_user.id, shipping_id: shipping.id)
  end

end
