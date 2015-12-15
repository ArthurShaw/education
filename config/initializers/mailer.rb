if ActiveRecord::Base.connection.tables.include?('settings') and !defined?(::Rake)
  if MailerSettings.get_all[:smtp_settings]
    ActionMailer::Base.smtp_settings.merge!(mailer_settings)
  end
end