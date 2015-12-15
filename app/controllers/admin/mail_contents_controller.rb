class Admin::MailContentsController < ApplicationController
  before_action { check_permission(:admin) }
  before_action :find_mail_content, only: [:edit, :update, :show]

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

  def configure
    @settings = ActionMailer::Base.smtp_settings
  end

  def save_settings
    settings = params[:config]
    if settings
      params = {
          address: settings[:address],
          port: settings[:port],
          domain: settings[:domain],
          user_name: settings[:user_name],
          password: settings[:password]
      }

      ActionMailer::Base.smtp_settings.merge!(params)

      # MailerSettings.smtp_settings = params

    end
    redirect_to admin_mail_contents_path
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