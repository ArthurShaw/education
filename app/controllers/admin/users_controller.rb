class Admin::UsersController < ApplicationController

  before_action { check_permission(:admin) }

  def new
    @admin = User.new
  end

  def index
    @admins = User.joins(:roles).where(roles: {name: Role::ADMIN_ROLES}).distinct
  end

  def create
    @admin = User.new(user_params)
    @admin.add_role :admin
    # roles = params[:roles]
    # Role::ADMIN_ROLES.each do |role|
    #   if roles[role.to_s]
    #     @admin.add_role role
    #   end
    # end

    if @admin.save
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def destroy
    @admin = User.find(params[:id])
    @admin.destroy
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
