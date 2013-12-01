require 'spec_helper'

describe BlastsController do
  context "when not logged in" do
    it "can not view any blast"
    it "can not view all blasts"
    it "can not create blasts"
    it "can not update blasts"
    it "can not destroy blasts"
    it "can not deliver blasts"
  end

  context "with a logged-in user" do
    context "when viewing blasts" do
      it "responds successfully"
      it "returns with all the blasts"
    end

    context "when returning a single blast" do
      it "responds successfully"
      it "returns with the blast we wanted"
    end

    context "when creating a blast" do
      it "responds successfully"
      it "creates a new blast record"
    end

    context "when updating a blast" do
      it "responds successfully"
      it "updates the blast record"
    end

    context "when destroying a blast" do
      context "that hasn't been sent" do
        it "responds successfully"
        it "removes the blast record"
      end

      context "that has been sent" do
        it "responds with an error"
      end
    end

    context "when delivering a blast" do
      it "responds successfully"
      it "updates the blast record's sent_at"
      it "enqueues the blast for delivery"
    end
  end
end
