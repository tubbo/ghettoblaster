
# HTTP API for seeing how many Subscribers we have to the list

class SubscribersController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!, except: %w(create destroy)
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
      halt!
    end
  end

  # PUT /subscribers/1
  def update
    halt! unless @subscriber.update_attributes editable_params
    respond_with @subscriber
  end

  # DELETE /subscribers/1
  def destroy
    halt! unless @subscriber.destroy
    halt notice: 'Subscriber has been deleted'
  end

  private
  def editable_params
    params.require(:subscriber).permit :name, :email
  end

  def searchable_params
    params.permit :name, :email, :created_at
  end

  def halt!
    halt alert: "Error: #{@subscriber.error_messages}" and return
  end

  def find_subscriber
    @subscriber = Subscriber.find params[:id]

    halt 404 unless @subscriber.present?
  end
end
