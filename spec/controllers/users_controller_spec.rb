require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #users:string" do
    it "returns http success" do
      get :users:string
      expect(response).to have_http_status(:success)
    end
  end

end
