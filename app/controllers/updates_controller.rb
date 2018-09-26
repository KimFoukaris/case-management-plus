class UpdatesController < ApplicationController
  before_action :set_update, only: [:show, :edit, :update]
  before_action :require_logged_in

  def index
    if params[:beneficiary_id]
      @beneficiary = Beneficiary.find(params[:beneficiary_id])
      @updates = Beneficiary.find(params[:beneficiary_id]).updates
      render json: @updates
    else
      @updates = Update.all
      #render json: @updates
    end
  end

  def new
    if params[:beneficiary_id] && !Beneficiary.exists?(params[:beneficiary_id])
      redirect_to beneficiaries_path, notice: "Beneficiary not found."
    else
      @update = Update.new(beneficiary_id: params[:beneficiary_id])
    end
  end

  def create
    @update = Update.new(update_params)
    if @update.save
      redirect_to beneficiary_update_path(params[:update][:beneficiary_id], @update), notice: 'Note was successfuly created'
    else
      render :new
    end
  end

  def show
    @message = params[:message] if params[:message]
    @message ||= false
  end

  def edit
  end

  def update
    if @update.update(update_params)
      redirect_to update_path(@update), notice: 'Note was successfully updated'
    else
      render :edit
    end
  end

  private

  def set_update
    @update = Update.find(params[:id])
  end

  def update_params
    params.require(:update).permit(
      :user_id,
      :beneficiary_id,
      :notes,
      :complete,
      :date
    )
  end

end
