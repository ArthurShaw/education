class UsersController < ApplicationController
  def profile
    @user = current_user
    unless current_user
      redirect_to new_user_session_path
    end
    if @user.has_role? :admin
      redirect_to admin_listener_requests_path
    else
      render 'speaker_profile'
    end
  end
end
