require 'spec_helper'

describe SubscribersController do
  context "GET 'index'" do
    it "renders the new subscriber form" do
      get :index

      response.status.should == 200
    end
  end

  context "POST 'create'" do
    it "creates a new subscriber record with the right attrs" do
      post :create, subscriber: { name: "Test", email: 'test@example.net' }

      response.status.should == 302
    end

    it "fails with a blank name" do
      post :create, subscriber: { name: "", email: 'test@example.org' }

      response.status.should == 422
    end

    it "fails with a blank email" do
      post :create, subscriber: { name: "Test", email: "" }

      response.status.should == 422
    end
  end
end
