class UserMailerPreview < ActionMailer::Preview

  def welcome_listener_email
    UserMailer.welcome_listener_email(ListenerRequest.first)
  end

  def workshop_confirmed_email
    UserMailer.workshop_confirmed_email(Workshop.first)
  end
end