class StaffsController < ApplicationController
  before_filter :authenticate_user!
  #before_action :set_staff, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :html

  def index
    @staffs = current_user.staffs
    respond_with(@staffs)
  end

  def show
    respond_with(@staff)
  end

  def new
    @staff = Staff.new
    respond_with(@staff)
  end

  def edit
  end

  def create
    @staff = Staff.new(staff_params)
    @staff.owner_id = current_user.id
    @staff.save
    respond_with(@staff)
  end

  def update
    @staff.update(staff_params)
    respond_with(@staff)
  end

  def destroy
    @staff.destroy
    respond_with(@staff)
  end

  private
    def set_staff
      @staff = Staff.find(params[:id])
    end

    def staff_params
      params.require(:staff).permit(:owner_id, :user_id, :first_name, :last_name, :email)
    end
end
