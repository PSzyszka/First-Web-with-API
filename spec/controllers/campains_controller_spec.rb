require 'rails_helper'

RSpec.describe CampainsController do
  describe "GET index" do
    it "assigns @campains" do
      campains = [double(:campain)]
      allow(Unamo::GetData).to receive(:campains).and_return(campains)
      get :index
      expect(assigns(:campains)).to eq(campains)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assigns @keywords and render show template" do
      keywords = [double(:keyword)]
      allow(Unamo::GetData).to receive(:keywords).and_return(keywords)
      get :show, params: { id: 1 }

      expect(assigns(:keywords)).to eq(keywords)
      expect(response).to render_template("show")
    end
  end
end
