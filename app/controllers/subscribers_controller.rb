class SubscribersController < ApplicationController
  respond_to :html

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

  # DELETE /subscribers/1
  def destroy
    @subscriber = Subscriber.find params[:id]

    case
    when @subscriber.present? && @subscriber.destroy
      render 'unsubscribed'
    when @subscriber.present?
      render 'index', alert: "Error unsubscribing: #{@subscriber.errors.full_messages}"
    else
      render 'index', alert: "Error: Could not find subscriber."
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
