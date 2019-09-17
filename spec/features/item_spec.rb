require 'rails_helper'
include Warden::Test::Helpers

feature 'items', type: feature do
  # let(:user) { create(:user) }
  background do
    create_list(:user, 2)
    user_seller = User.first
    shipping = user_seller.shippings.create(FactoryBot.attributes_for(:shipping, user: user_seller))
    user_buyer = User.last
    shipping = user_buyer.shippings.create(FactoryBot.attributes_for(:shipping, user: user_buyer))
    credit = user_buyer.credits.create(FactoryBot.attributes_for(:credit, user: user_buyer))
    category = create(:category)
    category = category.children.create(name: "children")
    category = category.children.create(name: "grand_children")
    login_as(user_seller, :scope => :user)
    visit root_path
    
  end
  
  scenario 'ログイン後、商品を出品' do
    user_seller = User.first
    category = Category.last
    user_buyer = User.last

    page.all("a[href='/items/new']")[0].click
    expect(current_path).to eq new_item_path
    #出品
    expect{
      fill_in 'item_name', with: "統合テスト"
      fill_in 'item_text', with: "統合テストを実行中"
      find_by_id('item_category_id', visible: false).set(category.id)
      fill_in 'item_price', with: 12345
      select '新品、未使用', from: 'item_condition_id'
      select '送料込み(出品者負担)', from: 'item_cost_burden_id'
      select '北海道', from: 'item_shipping_from'
      select '1~2日で発送', from: 'item_shipping_day_id' 
      attach_file('item_image', "#{Rails.root}/app/assets/images/card.png")
      find_button().click
    }.to change(Item, :count).by(1)
    
    page.all("a[href='/users/#{user_seller.id}']")[0].click
    expect(current_path).to eq "/users/#{user_seller.id}" 
    page.all("a[href='/users/#{user_seller.id}/logout']")[0].click
    expect(current_path).to eq logout_user_path(user_seller)
    page.all("a[href='/users/sign_out']")[0].click
    
    #別のユーザーでログインして、トップページに移動
    logout(:user)
    login_as(user_buyer, :scope => :user)
    visit root_path

    #商品画面に遷移
    page.all("a[href='/items/#{Item.first.id}']")[0].click
    expect(current_path).to eq item_path(Item.first)

    #商品購入画面に遷移
    page.all("a[href='/items/#{Item.first.id}/purchase_confirmation']")[0].click
    expect(current_path).to eq purchase_confirmation_item_path(Item.first)
    
    #商品購入
    expect{
      page.all("a[href='/items/#{Item.first.id}/purchase']")[0].click
    }.to change(Order, :count).by(1)
  end

  scenario 'ログイン後、商品を出品したら、編集して削除' do
    
    user_seller = User.first
    shipping = user_seller.shippings.first
    category = Category.last
    item = user_seller.items.create(FactoryBot.attributes_for(:item, category: category, shipping: user_seller.shippings.first))
    item.pictures.create(FactoryBot.attributes_for(:picture))  
    category = Category.first.children.first.children.create(name: "grand_children_edit")
    
    #トップページからマイページに移動
    page.all("a[href='/users/#{user_seller.id}']")[0].click
    expect(current_path).to eq "/users/#{user_seller.id}" 

    #マイページから出品商品一覧ページに移動
    page.all("a[href='/users/#{user_seller.id}/items']")[0].click
    expect(current_path).to eq items_user_path(user_seller)
    
    #出品一覧ページから商品詳細ページに移動
    page.all("a[href='/items/#{user_seller.items.first.id}']")[0].click
    expect(current_path).to eq item_path(user_seller.items.first)
    
    #商品詳細ページから編集ページに移動
    page.all("a[href='/items/#{user_seller.items.first.id}/edit']")[0].click
    expect(current_path).to eq edit_item_path(user_seller.items.first)
    
    #出品した商品を編集
    expect{
      fill_in 'item_name', with: "統合テスト編集後"
      fill_in 'item_text', with: "統合テストを編集中"
      find_by_id('item_category_id', visible: false).set(category.id)
      fill_in 'item_price', with: 123
      select '全体的に状態が悪い', from: 'item_condition_id'
      select '着払い(購入者負担)', from: 'item_cost_burden_id'
      select '福岡県', from: 'item_shipping_from'
      select '3~7日で発送', from: 'item_shipping_day_id' 
      attach_file('item_image', "#{Rails.root}/app/assets/images/visacard.png")
      find_button().click
    }.to change(Item, :count).by(0)
    #トップページからマイページに移動
    page.all("a[href='/users/#{user_seller.id}']")[0].click
    expect(current_path).to eq "/users/#{user_seller.id}" 

    #マイページから出品商品一覧ページに移動
    page.all("a[href='/users/#{user_seller.id}/items']")[0].click
    expect(current_path).to eq items_user_path(user_seller)
    
    #出品一覧ページから商品詳細ページに移動
    page.all("a[href='/items/#{user_seller.items.first.id}']")[0].click
    expect(current_path).to eq item_path(user_seller.items.first)
    
    #商品を削除したら、マイページに遷移。
    expect{
      page.all("a[href='/items/#{user_seller.items.first.id}']", visible: false)[0].click
    }.to change(Item, :count).by(-1)
    expect(current_path).to eq "/users/#{user_seller.id}/profile" 

  end
end