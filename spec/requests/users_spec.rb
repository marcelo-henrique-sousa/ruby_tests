require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    # before do
    #   get users_path
    # end use this if you requests and tests not require previus updates...
    it "returns success status" do
      get users_path
      expect(response).to have_http_status(:success)
    end
    it "the user`s title is present" do
      users = create_list(:user, 5)
      get users_path
      users.each do |user|
        expect(response.body).to include(user.title)
      end
    end
  end

  describe "POST /users" do 
    context "when ti has valid params" do
      it "creates user with correct params" do
        user_attrs = FactoryBot.attributes_for(:user)
        post users_path, params: { user:user_attrs }
        expect(User.last).to have_attributes(user_attrs)
      end
    end

    context "when it invalid params" do 
      it "does not create user" do
        expect{
          post users_path, params: { user: { kind: '', name: '', level: '' } }
        }.to_not change(User, :count)
      end
    end
  end
end