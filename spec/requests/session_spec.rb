require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      # "/session/new"
      get '/login'
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      # "/session/create"
      post '/login'
      expect(response).to have_http_status(302)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      # "/session/destroy"
      get '/logout'
      expect(response).to have_http_status(302)
    end
  end

end
