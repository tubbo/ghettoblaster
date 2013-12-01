
# HTTP API for seeing how many Subscribers we have to the list

class SubscribersController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!, except: %w(create)
  before_filter :find_subscriber, except: %w(index create)

  # GET /
  def index
    @subscribers = Subscriber.where searchable_params

    respond_with @subscribers
  end

  # GET /subscribers/1
  def show
    respond_with @subscriber
  end

  # POST /subscribers
  def create
    @subscriber = Subscriber.subscribe create_params

    if @subscriber.save
      respond_with @subscriber
    else
      halt_with_errors
    end
  end

  # PUT /subscribers/1
  def update
    if @subscriber.update_attributes updatable_params
      respond_with @subscriber
    else
      halt_with_errors
    end
  end

  # DELETE /subscribers/1
  def destroy
    if @subscriber.destroy
      render 'index'
    else
      halt_with_errors
    end
  end

  # GET /unsubscribe
  def unsubscribe
    @subscriber = Subscriber.new
  end

  private
  def updatable_params
    params.require(:subscriber).permit :name, :email
  end

  def searchable_params
    params.permit :name, :email, :created_at
  end

  def halt_with_errors
    halt alert: "Error: #{@subscriber.error_messages}"
  end

  def find_subscriber
    @subscriber = Subscriber.find params[:id]

    halt 404 unless @subscriber.present?
  end
end
