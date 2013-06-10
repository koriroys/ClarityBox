if Rails.env.production?
  ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "claritybox.co",
  :user_name            => ENV['gmail_username'],
  :password             => ENV['gmail_password'],
  :authentication       => "plain",
  :enable_starttls_auto => true
}
elsif Rails.env.development?
    ActionMailer::Base.smtp_settings = {
  :address              => "localhost",
  :port                 => 1025,
  :domain               => "localhost:3000",
  :user_name            => ENV['gmail_username'],
  :password             => ENV['gmail_password'],
  :authentication       => "plain",
  :enable_starttls_auto => true
}
end
  ActionMailer::Base.default_url_options[:host] = "localhost:3000"
