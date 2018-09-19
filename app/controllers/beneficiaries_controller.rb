class BeneficiariesController < ApplicationController
  before_action :set_beneficiary, only: [:show, :edit, :update]
  before_action :require_logged_in

  def index
    @beneficiaries = Beneficiary.all
  end

  def new
    @beneficiary = Beneficiary.new
  end

  def create
    @beneficiary = Beneficiary.new(beneficiary_params)
    if @beneficiary.save
      redirect_to beneficiary_path(@beneficiary), notice: 'Beneficiary was successfully created'
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
    if @beneficiary.update(beneficiary_params)
      redirect_to beneficiary_path(@beneficiary), notice: 'Beneficiary was successfully updated'
    else
      render :edit
    end
  end

  private

  def set_beneficiary
    @beneficiary = Beneficiary.find(params[:id])
  end

  def beneficiary_params
    params.require(:beneficiary).permit(
      :name,
      :date_of_birth,
      :gender,
      :id_number
    )
  end

end
