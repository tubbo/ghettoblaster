class SubscribersController < ApplicationController
  respond_to :html

  # GET /
  def index
    @subscriber = Subscriber.new

    respond_with @subscriber
  end

  # POST /subscribers
  def create
    @subscriber = Subscriber.new params[:subscriber]

    if @subscriber.save
      redirect_to '/thanks'
    else
      render 'index', \
        alert: "Error: #{@subscriber.errors.full_messages.join(', ')}",
        status: 422
    end
  end
end
