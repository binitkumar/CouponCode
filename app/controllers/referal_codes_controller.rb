class ReferalCodesController < ApplicationController
  #before_action :set_referal_code, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :html

  def verify

  end
  
  def verification_result
    @referal_code = ReferalCode.find_by_code params[:code]    
  end

  def index
    @referal_codes = ReferalCode.all
    respond_with(@referal_codes)
  end

  def show
    respond_with(@referal_code)
  end

  def new
    @referal_code = ReferalCode.new
    respond_with(@referal_code)
  end

  def edit
  end

  def create
    @referal_code = ReferalCode.new(referal_code_params)    
    @referal_code.save
    respond_with(@referal_code)
  end

  def update
    @referal_code.update(referal_code_params)
    respond_with(@referal_code)
  end

  def destroy
    @referal_code.destroy
    respond_with(@referal_code)
  end

  private
    def set_referal_code
      @referal_code = ReferalCode.find(params[:id])
    end

    def referal_code_params
      params.require(:referal_code).permit(:hashtag_id, :email, :code, :discount_code, :provider_email, :first_name, :last_name)
    end
end
