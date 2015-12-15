class Admin::MailContentsController < ApplicationController
  before_action { check_permission(:admin) }
  before_action :find_mail_content, only: [:edit, :update, :show, :send_schedule]

  def index
    @contents = MailContent.all

  end

  def edit
  end

  def show

  end

  def update

    @content.update(mail_contents_params)

    redirect_to admin_mail_contents_path
  end

  def send_schedule
    @users = User.all
    @listeners = ListenerRequest.all
    UserMailer.send_schedule_program(@users, @listeners).deliver_now
    flash[:notice] = 'Всем высланы письма с расписанием'
    redirect_to admin_mail_content_path(@content)
  end

  private

  def mail_contents_params
    params.require(:mail_content).permit(:content, :content_en)
  end

  def find_mail_content
    @content = MailContent.find(params[:id])
    render_404 unless @content
  end
end