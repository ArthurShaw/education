class UserMailer < ApplicationMailer


  def welcome_listener_email(listener_request)
    @listener_request = listener_request;
    @url = 'http://foss-conf.bitnamiapp.com/ru/listener_requests/new'
    mail(to: @listener_request.email, subject: 'Ваша заявка получена!')
  end

end
