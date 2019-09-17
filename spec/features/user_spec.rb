require 'rails_helper'

feature 'users', type: feature do
  let(:user) { create(:user) }
  scenario 'lonin user' do
    #ログインしていない状態でトップページに移動
    visit root_path
    expect(page).to have_no_content('マイページ')
    #ログインページに移動
    page.all(".post")[1].click
    expect(current_path).to eq new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    page.all(".login")[0].click
    #ログインしたらトップページに遷移
    expect(current_path).to eq root_path
    expect(page).to have_content('マイページ')
    
  end

end