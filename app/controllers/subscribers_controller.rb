class SubscribersController < ApplicationController
  respond_to :html

  # GET /
  def index
    @subscriber = Subscriber.new

    respond_with @subscriber
  end

  # POST /subscribers
  def create
    @subscriber = Subscriber.new creatable_params

    if @subscriber.save
      redirect_to '/thanks'
    else
      render 'index', alert: with_error_message
    end
  end

  # GET /thanks
  def thanks
    render 'thanks', layout: !request.xhr?
  end

  private
  def creatable_params
    params.require(:subscriber).permit :name, :email
  end

  def with_error_message
    "Error: #{subscriber_errors}"
  end

  def subscriber_errors
    @subscriber.errors.full_messages.join ', '
  end
end
