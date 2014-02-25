class SubscribersController < ApplicationController
  respond_to :html
  before_action :find_or_create_subsriber, :only => %w(create)

  # GET /
  def index
    @subscriber = Subscriber.new

    respond_with @subscriber
  end

  # POST /subscribers
  def create
    @subscriber = Subscriber.find_or_create_by_email_and_name create_params

    if @subscriber.save
      render 'thanks', layout: use_layout?
    else
      render 'index', alert: with_error_message
    end
  end

  # Unsubscribes a subscriber...this is a little weird because the user
  # doesn't necessarily know their own ID. So this is actually a
  # 'collection' action which takes in params[:email] and searches for a
  # user by that unique constraint.
  #
  # DELETE /subscribers/?email=lester@example.com
  def destroy
    @subscriber = Subscriber.where(email: params[:email]).first

    if @subscriber.present? && @subscriber.destroy
      render 'unsubscribed'
    else
      render 'index', alert: "Error unsubscribing: #{@subscriber.errors.full_messages}"
    end
  end

  # GET /thanks
  def thanks
    render 'thanks'
  end

  private
  def search_params
    params.permit :name, :email
  end

  def create_params
    params.require(:subscriber).permit :name, :email
  end

  def with_error_message
    "Error: #{subscriber_errors}"
  end

  def subscriber_errors
    @subscriber.errors.full_messages.join ', '
  end

  def use_layout?
    not request.xhr?
  end
end
