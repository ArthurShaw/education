mailer_settings = MailerSettings.smtp_settings
if mailer_settings
  ActionMailer::Base.smtp_settings.merge!(mailer_settings)
end