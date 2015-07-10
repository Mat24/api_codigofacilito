require 'rails_helper'

RSpec.describe Api::V1::UsersController,type: :request  do
  describe "POST/users" do
    before :each do
      auth = {provider: "facebook", uid: "12dsadasd1y23g12", info: {email: "u@mail.com"} }
      post "/api/v1/users", {auth: auth}
    end

    it { have_http_status(200) }

    it {change(User,:count).by(1)}

    it "responds with the user found or created" do
      json = JSON.parse(response.body)
      expect(json["email"]).to eq("u@mail.com")
    end
  end

end
