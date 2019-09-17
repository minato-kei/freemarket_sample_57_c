require 'rails_helper'
describe ItemsController do

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    it "renders the :new template" do
      user = create(:user)
      sign_in user
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #show" do
    it "responds successfully" do
      item = create(:item)
      user = create(:user)
      get :show, params: {id: item}
      expect(response).to render_template :show  
    end
    
    it "returns a 200 response" do
      item = create(:item)
      user = create(:user)
      get :show, params: {id: item}
      expect(response).to have_http_status "200"
    end
  end

  
  describe 'GET #edit' do
    it "assigns the requested item to @item" do
      item = create(:item)
      user = create(:user)
      get :edit, params: { id: item}
      expect(assigns(:item)).to eq item
    end
    it "renders the :edit template" do
      item = create(:item)
      user = create(:user)
      sign_in user
      get :edit,params: {id:item}
      expect(response).to render_template :edit      
    end
  end
end