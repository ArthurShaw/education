class UserMailer < ApplicationMailer


  def welcome_listener_email(listener_request)
    @listener_request = listener_request
    @url = new_listener_request_url
    mail(to: @listener_request.email, subject: t('success_registration'))
  end

  def welcome_user_email(user)
    @user = user
    @url = new_user_registration_url
    mail(to: @user.email, subject: t('success_registration'))
  end

  def new_speaker_email(user)
    @user = user
    @admins = User.joins(:roles).where(roles: {name: Role::ADMIN_ROLES}).distinct.pluck(:email)
    @url = new_user_registration_url
    mail(to: @admins, subject: 'Новый докладчик зарегистрировался')
  end

  def new_workshop_email(workshop)
    @workshop = workshop
    @admins = User.joins(:roles).where(roles: {name: Role::ADMIN_ROLES}).distinct.pluck(:email)
    @url = new_workshop_url
    mail(to: @admins, subject: 'Добавлен новый доклад')
  end

  def workshop_confirmed_email(workshop)
    @workshop = workshop
    @url = approve_admin_workshop_url(@workshop)
    mail(to: workshop.user.email, subject: t('workshop_confirm_email'))
  end

  def workshop_denied_email(workshop)
    @workshop = workshop
    @url = deny_admin_workshop_url(@workshop)
    mail(to: workshop.user.email, subject: t('workshop_deny_email'))
  end

  def new_comment_email(workshop)
    @workshop = workshop
    @url = new_admin_workshop_comment_url(@workshop)
    mail(to: @workshop.user.email, subject: t('new_comment_email'))
  end


end
