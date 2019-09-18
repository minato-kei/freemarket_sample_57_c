require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }
  describe 'GET #show' do
    it "renders the :show template" do
      
      sign_in user      
      get :show, params: {id: user.id}
      expect(response).to render_template :show
    end
  end

  describe 'GET #profile' do
    it "renders the :profile template" do
      
      sign_in user      
      get :profile, params: {id: user.id}
      expect(response).to render_template :profile
    end
  end

  describe 'GET #edit' do
    it "renders the :edit template" do
      
      sign_in user       
      get :edit, params: {id: user.id}
      expect(response).to render_template :edit
    end
  end

  describe 'GET #items' do
    it "renders the :items template" do
      login_user user
      category = create(:category)
      shipping = user.shippings.create(FactoryBot.attributes_for(:shipping, user: user))
      item = user.items.create(FactoryBot.attributes_for(:item, category: category, shipping: user.shippings.first))      
      get :items, params: {id: user.id}
      expect(response).to render_template :items
    end
  end

  describe 'GET #sign_up_user_info' do
    it "renders the :sign_up_user_info template" do
      get :sign_up_user_info
      expect(response).to render_template :sign_up_user_info
    end
  end

  describe 'GET #sign_up_phone' do
    it "renders the :sign_up_phone template" do
      get :sign_up_phone, params: {user: {nickname: "チカキン", email: "gabriel.pacocha@hartmann.io", password: "00000000",
                                  password_confirmation: "00000000", first_name_kanji: "元親", last_name_kanji: "長宗我部", 
                                  first_name_kana: "モトチカ", last_name_kana: "チョウソカベ",
                                  phone_number: "09012345678", sex: "male",
                                  "birthday(1i)": 2000 , "birthday(2i)": 11, "birthday(3i)": 11}}
      expect(response).to render_template :sign_up_phone
    end
  end

  describe 'GET #sign_up_sms' do
    it "renders the :sign_up_sms template" do
      get :sign_up_sms, params: {user: {phone_number: "090-1234-5678"}}
      expect(response).to render_template :sign_up_sms
    end
  end

  describe 'GET #sign_up_shipping' do
    it "renders the :sign_up_shipping template" do
      get :sign_up_shipping,  params:  {user: {sign_up_sms: 123}}, 
                              session: {r: 123, 
                                nickname:              "チカキン",
                                email:                 "gabriel.pacocha@hartmann.io",
                                password:              "00000000",
                                password_confirmation: "00000000", 
                                first_name_kanji:      "元親", 
                                last_name_kanji:       "長宗我部", 
                                first_name_kana:       "モトチカ", 
                                last_name_kana:        "チョウソカベ", 
                                phone_number:          "09012345678", 
                                birthday:              Date.today}
      expect(response).to render_template :sign_up_shipping
    end
  end

  describe 'GET #sign_up_credit' do
    it "renders the :sign_up_credit template" do
      get :sign_up_credit,  params:  {shipping: {zipcode: 1234567,
                                                 pref: 12,
                                                 city: '渋谷区',
                                                 address: '神南1-2-3',
                                                 building: 'フィボナッチビルディング1123',
                                                 phone: "09012345678"}},
                            session: {id: user.id}
      
      expect(response).to render_template :sign_up_credit
    end
  end


end