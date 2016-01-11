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

  def speakers
    @speakers = User.joins(:roles).where.not(roles: {name: Role::ADMIN_ROLES}).distinct
  end

  def excel
    spreadsheet_name = 'Докладчики'

    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet :name => spreadsheet_name
    sheet1.row(0).replace [t('user_params.first_name'),
                           t('user_params.last_name'),
                           t('user_params.middle_name'),
                           t('listener_requests.email'),
                           t('user_params.country'),
                           t('user_params.city'),
                           t('user_params.phone'),
                           t('user_params.degree'),
                           t('user_params.work_place'),
                           t('user_params.occupation'),
                           t('arrival'),
                           t('departure'),
                           t('hotel')]
    @speakers = User.joins(:roles).where.not(roles: {name: Role::ADMIN_ROLES}).distinct
    @speakers.each_with_index { |speaker, i|
      hotel = speaker.hotel ? speaker.hotel.title : 'Не требуется'
      sheet1.row(i+1).replace [speaker.first_name, speaker.last_name, speaker.middle_name, speaker.email, speaker.country, speaker.city, speaker.phone, speaker.degree, speaker.work_place, speaker.occupation, speaker.arrival, speaker.departure, hotel]
    }

    export_file_path = [Rails.root, "public", "uploads", "exports", "#{ spreadsheet_name }_#{ DateTime.now.to_s }.xls"].join("/")
    book.write export_file_path
    send_file export_file_path, :content_type => "application/vnd.ms-excel", :disposition => 'inline'
  end
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
