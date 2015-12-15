class UserMailer < ApplicationMailer


  def welcome_listener_email(listener_request)
    attachments.inline['forum_logo.png'] = File.read("#{Rails.root}/app/assets/images/forum_logo.png")
    @listener_request_email_content = MailContent.find(1)
    @listener_request = listener_request
    @url = new_listener_request_url
    mail(to: @listener_request.email, subject: t('success_registration'))
  end

  def welcome_user_email(user)
    attachments.inline['forum_logo.png'] = File.read("#{Rails.root}/app/assets/images/forum_logo.png")
    @user_email_content = MailContent.find(2)
    @user = user
    @url = new_user_registration_url
    mail(to: @user.email, subject: t('success_registration'))
  end

  def new_speaker_email(user)
    attachments.inline['forum_logo.png'] = File.read("#{Rails.root}/app/assets/images/forum_logo.png")
    @new_speaker_email_content = MailContent.find(3)
    @user = user
    @admins = User.joins(:roles).where(roles: {name: Role::ADMIN_ROLES}).distinct.pluck(:email)
    @url = new_user_registration_url
    mail(to: @admins, subject: 'Новый докладчик зарегистрировался')
  end

  def new_workshop_email(workshop)
    attachments.inline['forum_logo.png'] = File.read("#{Rails.root}/app/assets/images/forum_logo.png")
    @new_workshop_email_content = MailContent.find(4)
    @workshop = workshop
    @admins = User.joins(:roles).where(roles: {name: Role::ADMIN_ROLES}).distinct.pluck(:email)
    @url = new_workshop_url
    mail(to: @admins, subject: 'Добавлен новый доклад')
  end

  def workshop_confirmed_email(workshop)
    attachments.inline['forum_logo.png'] = File.read("#{Rails.root}/app/assets/images/forum_logo.png")
    attachments.inline['forum_logo.png'] = File.read("#{Rails.root}/app/assets/images/forum_logo.png")
    @confirm_workshop_content = MailContent.find(5)
    @workshop = workshop
    @url = approve_admin_workshop_url(@workshop)
    mail(to: workshop.user.email, subject: t('workshop_confirm_email'))
  end

  def workshop_denied_email(workshop)
    attachments.inline['forum_logo.png'] = File.read("#{Rails.root}/app/assets/images/forum_logo.png")
    @deny_workshop_content = MailContent.find(6)
    @workshop = workshop
    @url = deny_admin_workshop_url(@workshop)
    mail(to: workshop.user.email, subject: t('workshop_deny_email'))
  end

  def new_comment_email(workshop)
    attachments.inline['forum_logo.png'] = File.read("#{Rails.root}/app/assets/images/forum_logo.png")
    @new_comment_email_content = MailContent.find(7)
    @workshop = workshop
    @url = new_admin_workshop_comment_url(@workshop)
    mail(to: @workshop.user.email, subject: t('new_comment_email'))
  end

  def send_schedule_program(users, listener_requests)
    attachments.inline['forum_logo.png'] = File.read("#{Rails.root}/app/assets/images/forum_logo.png")
    @schedule_email_content = MailContent.find(8)
    @users = users.joins(:roles).where.not(roles: {name: Role::ADMIN_ROLES}).distinct.pluck(:email)
    @listener_requests = listener_requests.pluck(:email)
    @url = send_schedule_admin_mail_content_url(@schedule_email_content)
    mail(to: [@users, @listener_requests], subject: t('schedule_program'))

  end
end
