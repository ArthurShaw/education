class UsersController < ApplicationController
  def profile
    @user = current_user
    unless current_user
      redirect_to new_user_session_path
    end
    if @user.has_role? :admin
      render 'admin_profile'
    else
      render 'speaker_profile'
    end
  end
end
