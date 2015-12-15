if ActiveRecord::Base.connection.tables.include?('settings') and !defined?(::Rake)
  mailer_settings = MailerSettings.smtp_settings
  if mailer_settings
    ActionMailer::Base.smtp_settings.merge!(mailer_settings)
  end
end