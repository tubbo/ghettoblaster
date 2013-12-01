require 'spec_helper'

describe SubscribersController do
  context "GET 'index'" do
    before { get :index, format: :json }

    it "responds successfully" do
      expect(response).to be_success
    end

    it "renders all subscribers in json" do
      expect(assigns(:subscribers)).to_not be_empty
    end
  end

  context "POST 'create'" do
    context "with the sunny day attributes" do
      before do
        post :create, subscriber: {
          name: "Test",
          email: 'test@example.net'
        }, format: :json
      end

      it "creates a new subscriber record" do
        expect(assigns(:subscriber)).to be_valid
      end

      it "redirects to the thank you page" do
        expect(response.status).to eq(200)
      end
    end

    context "with a blank name" do
      before do
        post :create, subscriber: {
          name: "",
          email: 'test@example.org'
        }, format: :json
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
        }, format: :json
      end

      it "renders the index page" do
        expect(response.status).to eq(200)
      end

      it "fails to save" do
        expect(assigns(:subscriber)).to_not be_valid
      end
    end
  end

  context "with an existing subscriber" do
    let(:subscriber) { subscribers :joe_blow }

    context "PUT 'update'" do
      before do
        put :update, id: subscriber.id, subscriber: {
          name: 'Joey Blowey'
        }, format: :json
      end

      it "responds successfully" do
        expect(response).to be_success
      end

      it "changes the attribute" do
        expect(subscriber.reload).to be_true
        expect(subscriber.name).to eq('Joey Blowey')
      end
    end

    context "DELETE 'update'" do
      before { delete :destroy, id: subscriber.id, format: :json }

      it "responds successfully" do
        expect(response).to be_success
      end

      it "removes the record" do
        expect(assigns(:subscriber).id).to be_nil
      end
    end

    context "GET 'show'" do
      before { get :show, id: subscriber.id, format: :json }
      let(:json) { JSON.parse response.body }

      it "responds successfully" do
        expect(response).to be_success
      end

      it "finds the right record" do
        expect(assigns(:subscriber).id).to eq(subscriber.id)
      end

      it "returns the record in JSON" do
        expect(json).to_not be_nil
        expect(json).to_not be_empty
        expect(json).to be_a Hash
      end
    end
  end
end
