class HashtagsController < ApplicationController
  #before_action :set_hashtag, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :html

  def validate

  end

  def index
    @hashtags = current_user.hashtags if current_user.admin?
    @hashtags = current_user.associated_staff.owner.hashtags if current_user.staff? && current_user.associated_staff
    respond_with(@hashtags)
  end

  def show
    respond_with(@hashtag)
  end

  def new
    @hashtag = Hashtag.new
    respond_with(@hashtag)
  end

  def edit
  end

  def create
    @hashtag = Hashtag.new(hashtag_params)
    @hashtag.user = current_user
    @hashtag.save
    respond_with(@hashtag)
  end

  def update
    @hashtag.update(hashtag_params)
    respond_with(@hashtag)
  end

  def destroy
    @hashtag.destroy
    respond_with(@hashtag)
  end

  private
    def set_hashtag
      @hashtag = Hashtag.find(params[:id])
    end

    def hashtag_params
      params.require(:hashtag).permit(:user_id, :discount, :permalink_url, :discount_code, :is_active, :max_referal_per_person, 
        :no_of_referal, authorized_emails_attributes: [:id, :email, :_destroy, :first_name, :last_name]
      )
    end
end
