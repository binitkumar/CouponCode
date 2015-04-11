class VisitorsController < ApplicationController

  def index
    if current_user
      if current_user.role == "Resturent Admin"
        redirect_to hashtags_path
      elsif current_user.role == "Customer"
        redirect_to validate_hashtags_path
      end
    end
  end
end
