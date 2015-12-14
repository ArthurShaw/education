class UserMailer < ApplicationMailer


  def welcome_listener_email(listener_request)
    @listener_request = listener_request
    @url = 'http://foss-conf.bitnamiapp.com/ru/listener_requests/new'
    mail(to: @listener_request.email, subject: t('success_registration'))
  end

  def welcome_user_email(user)
    @user = user
    @url = 'http://foss-conf.bitnamiapp.com/ru/sign_up'
    mail(to: @user.email, subject: t('success_registration'))
  end

  def new_speaker_email(user)
    @user = user
    @url = 'http://foss-conf.bitnamiapp.com/ru/sign_up'
    mail(to: Proc.new {user.email if user.has_role? :admin}, subject: 'Новый докладчик зарегистрировался')
  end

  def new_workshop_email(workshop)
    @workshop = workshop
    @url = 'http://foss-conf.bitnamiapp.com/ru/workshops/new'
    mail(to: Proc.new {user.email if user.has_role? :admin}, subject: 'Добавлен новый доклад')
  end

  def workshop_confirmed_email(workshop)
    @workshop = workshop
    @url = 'http://foss-conf.bitnamiapp.com/admin/workshops/:id/approve'
    mail(to: workshop.user.email, subject: t('workshop_confirm_email'))
  end

  def workshop_denied_email(workshop)
    @workshop = workshop
    @url = 'http://foss-conf.bitnamiapp.com/admin/workshops/:id/deny'
    mail(to: workshop.user.email, subject: t('workshop_deny_email'))
  end

  def new_comment_email(workshop)
    @workshop = workshop
    @url = 'http://foss-conf.bitnamiapp.com/admin/workshops/:workshop_id/comments/new'
    mail(to: @workshop.user.email, subject: t('new_comment_email'))
  end


end
