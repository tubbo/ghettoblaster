require 'spec_helper'

describe SubscribersController do
  context "GET 'index'" do
    it "renders the new subscriber form" do
      get :index

      response.should be_success
    end
  end

  context "POST 'create'" do
    it "creates a new subscriber record with the right attrs" do
      post :create, subscriber: { name: "Test", email: 'test@example.com' }

      response.should be_redirect
    end

    it "fails with a blank name" do
      post :create, subscriber: { name: "", email: 'test@example.com' }

      response.status.should == 422
    end

    it "fails with a blank email" do
      post :create, subscriber: { name: "Test", email: "" }

      response.status.should == 422
    end
  end
end
