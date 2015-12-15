if MailerSettings
  mailer_settings = MailerSettings.smtp_settings
  ActionMailer::Base.smtp_settings.merge!(mailer_settings)
end