ActionMailer::Base.smtp_settings = {
address:              'smtp.sendgrid.net',
port:                 587,
domain:               'info@timesink.tv',
user_name:             'apikey',
password:              Rails.application.credentials[Rails.env.to_sym][:sendgrid_password],
authentication:       'plain',
enable_starttls_auto: true }
