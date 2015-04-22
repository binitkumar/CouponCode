class AuthorizedEmailsController < ApplicationController
  before_action :set_authorized_email, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @authorized_emails = AuthorizedEmail.all
    respond_with(@authorized_emails)
  end

  def show
    respond_with(@authorized_email)
  end

  def new
    @authorized_email = AuthorizedEmail.new
    respond_with(@authorized_email)
  end

  def edit
  end

  def create
    @authorized_email = AuthorizedEmail.new(authorized_email_params)
    @authorized_email.save
    respond_with(@authorized_email)
  end

  def update
    @authorized_email.update(authorized_email_params)
    respond_with(@authorized_email)
  end

  def destroy
    @authorized_email.destroy
    respond_with(@authorized_email)
  end

  private
    def set_authorized_email
      @authorized_email = AuthorizedEmail.find(params[:id])
    end

    def authorized_email_params
      params.require(:authorized_email).permit(:hashtag_id, :email)
    end
end
