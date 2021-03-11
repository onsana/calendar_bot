require "rails_helper"

RSpec.describe "Admin::Dashboards", type: :request do
  describe "GET /index" do
    it "returns http success" do
      sign_in create(:admin)
      get admin_root_path
      expect(response).to have_http_status(:success)
    end

    it "returns http redirect for non-admin user" do
      sign_in create(:user)
      get admin_root_path
      expect(response).to have_http_status(302)
      follow_redirect!
      expect(response).to have_http_status(:success)
    end
  end
end
