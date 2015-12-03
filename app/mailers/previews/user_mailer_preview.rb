class UserMailerPreview < ActionMailer::Preview

  def welcome_listener_email
    UserMailer.welcome_listener_email(ListenerRequest.first)
  end

end