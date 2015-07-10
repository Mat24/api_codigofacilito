require 'rails_helper'

RSpec.describe Api::V1::MyPollsController, type: :request do

  describe "GET /index" do

    before(:each) do
      FactoryGirl.create_list(:my_poll,10)
      get "/api/v1/polls"
    end

    it "returns http success" do
      have_http_status(:success)
    end

    it "returns polls list" do
      json = JSON.parse(response.body)
      expect(json.length).to eq(MyPoll.count)
    end
  end

  describe "GET /polls/:id" do
    before(:each) do
      @poll = FactoryGirl.create(:my_poll)
      get "/api/v1/polls/#{@poll.id}"
    end
    it "returns http success" do
      have_http_status(:success)
    end

    it "returns same id" do
      json = JSON.parse(response.body)
      expect(json["id"]).to eq(@poll.id)
    end

    it "manda los atributos de la encuesta" do
      json = JSON.parse(response.body)
      expect(json.keys).to contain_exactly("id", "title", "description", "expires_at", "user_id" )
    end

  end

end
