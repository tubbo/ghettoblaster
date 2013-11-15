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
      render 'index', \
        alert: "Error: #{@subscriber.errors.full_messages.join(', ')}"
    end
  end

  private
  def creatable_params
    params.require(:subscriber).permit :name, :email
  end
end
