class UserMailerPreview < ActionMailer::Preview

  def welcome_listener_email
    UserMailer.welcome_listener_email(ListenerRequest.first)
  end

  def workshop_confirmed_email(workshop)
    @confirm_workshop_content = MailContent.find(5)
    @workshop = workshop
    @url = approve_admin_workshop_url(@workshop)
    mail(to: workshop.user.email, subject: t('workshop_confirm_email'))
  end
end