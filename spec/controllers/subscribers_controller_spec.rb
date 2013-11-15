require 'spec_helper'

describe SubscribersController do
  context "GET 'index'" do
    before { get :index }

    it "renders the new subscriber form" do
      expect(response.status).to eq(200)
    end
  end

  context "POST 'create'" do
    context "with the sunny day attributes" do
      before do
        post :create, subscriber: {
          name: "Test",
          email: 'test@example.net'
        }
      end

      it "creates a new subscriber record" do
        expect(assigns(:subscriber)).to be_valid
      end

      it "redirects to the thank you page" do
        expect(response.status).to eq(302)
      end
    end

    context "with a blank name" do
      before do
        post :create, subscriber: {
          name: "",
          email: 'test@example.org'
        }
      end

      it "renders the index page" do
        expect(response.status).to eq(200)
      end

      it "fails to save" do
        expect(assigns(:subscriber)).to_not be_valid
      end
    end

    context "with a blank email" do
      before do
        post :create, subscriber: {
          name: "Test",
          email: ""
        }
      end

      it "renders the index page" do
        expect(response.status).to eq(200)
      end

      it "fails to save" do
        expect(assigns(:subscriber)).to_not be_valid
      end
    end
  end
end
