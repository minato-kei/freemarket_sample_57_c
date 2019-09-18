require 'rails_helper'

feature 'users', type: feature do
  background "ユーザーを２人作成し、出品側でログイン" do
    @user = create_list(:user, 1).first
    visit root_path
  end
  scenario 'ログインテスト' do
    #ログインしていない状態でトップページに移動
    expect(page).to have_no_content('マイページ')
    #ログインページに移動
    page.all(".post")[1].click
    expect(current_path).to eq new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    page.all(".login")[0].click
    #ログインしたらトップページに遷移
    expect(current_path).to eq root_path
    expect(page).to have_content('マイページ')
  end

  scenario 'ユーザー新規登録' do
    #ログインしていない状態でトップページに移動
    visit sign_up_sns_users_path
    expect(current_path).to eq sign_up_sns_users_path
    #新規登録画面へ移動
    page.all("a[href='sign_up_user_info']")[0].click
    expect(current_path).to eq sign_up_user_info_users_path
    #ユーザー情報を入力
    expect{
      fill_in 'user_nickname', with: "テスト"
      fill_in 'user_email', with: "example2019@example.com"
      fill_in 'user_password', with: "00000000"
      fill_in 'user_password_confirmation', with: "00000000"
      fill_in 'user_first_name_kanji', with: "長宗我部"
      fill_in 'user_last_name_kanji', with: "元親"
      fill_in 'user_first_name_kana', with: "チョウソカベ"
      fill_in 'user_last_name_kana', with: "モトチカ"
      select '1999', from: 'user_birthday_1i'
      select '12', from: 'user_birthday_2i'
      select '25', from: 'user_birthday_3i'
      find_button().click
    }.to change(User, :count).by(0)

    expect(current_path).to eq sign_up_phone_users_path
    #SMS認証のため、電話番号を入力
    expect{
      fill_in 'user_phone_number', with: "09012345678"
      find_button().click
    }.to change(User, :count).by(0)

    expect(current_path).to eq  sign_up_sms_users_path
    #SMS認証のパスワードを入力
    expect{
      fill_in 'user_sign_up_sms', with: find(".notice").text
      find_button().click
    }.to change(User, :count).by(1)
    
    expect(current_path).to eq  sign_up_shipping_users_path
#SMS認証のパスワードを入力
    expect{
      
      fill_in 'shipping_first_name_kanji', with: "吉良"
      fill_in 'shipping_last_name_kanji', with: "吉影"
      fill_in 'shipping_first_name_kana', with: "キラ"
      fill_in 'shipping_last_name_kana', with: "ヨシカゲ"
      fill_in 'shipping_zipcode', with: 1234567
      fill_in 'shipping_pref', with: "宮城県"
      fill_in 'shipping_city', with: "杜王町"
      fill_in 'shipping_address', with: "浄禅寺1-128"
      fill_in 'shipping_building', with: "猫草"
      fill_in 'shipping_phone', with: "09012345678"

      find_button().click
    }.to change(Shipping, :count).by(1)

    expect(current_path).to eq sign_up_credit_users_path

    expect{
      fill_in 'number', with: "4242424242424242"
      fill_in 'cvc', with: "123"
      select '2020', from: '_exp_year_1i'
      select '12', from: '_exp_month_2i'
      find_button().click
    }.to change(Credit, :count).by(1)

    expect(current_path).to eq sign_up_complete_users_path
  end

end