class BlastsController < ApplicationController
  before_filter :find_blast, except: %w(index create)

  def index
    @blasts = Blast.where searchable_params

    respond_with @blasts
  end

  def show
    respond_with @blast
  end

  def create
    @blast = Blast.new updatable_params

    if @blast.save
      respond_with @blast
    else
      halt alert: @blast.error_messages
    end
  end

  def update
    if @blast.update_attributes updatable_params
      respond_with @blast
    else
      halt alert: @blast.error_messages
    end
  end

  def destroy
    if @blast.destroy
      halt notice: "Blast deleted."
    else
      halt alert: @blast.error_messages
    end
  end

  # Deliver this message
  #
  # GET /blasts/1/deliver
  def deliver
    if @blast.deliver
      respond_with @blast, notice: "Blast has been delivered."
    else
      halt alert: @blast.error_messages
    end
  end

  private
  def find_blast
    @blast = Blast.find params[:id]

    halt status: 404 unless @blast.present?
  end

  def updatable_params
    params.require(:blast).permit :subject, :body, :is_published
  end

  def searchable_params
    params.permit :subject, :body, :created_at, :is_published
  end
end
