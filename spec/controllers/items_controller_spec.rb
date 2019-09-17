require 'rails_helper'
describe ItemsController do
  
  describe 'GET #index' do
  
    it "@itemsという変数が正しく定義されているか" do
      @items = create_list(:item, 4, user_id: user.id, category_id: categories.first.id, size_id: sizes.first.id, status_id: statuses.first.id)
      get :index
      expect(assigns(:items)).to eq(@items)
    end

    it "# 該当するビューが描画されているか" do
      get :index
      expect(response).to render_template :index
    end
  end

end