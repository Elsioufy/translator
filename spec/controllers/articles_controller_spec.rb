require 'rails_helper'

describe ArticlesController, type: :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end
  describe "GET show" do
    it "has a 200 status code" do
      article = create(:article)
      get :show, params: {id: article.id}
      expect(response.status).to eq(200)
    end
  end
end
