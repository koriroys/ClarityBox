if Rails.env.production?
  ActionMailer::Base.smtp_settings = {
  :address              => "localhost",
  :port                 => 1025,
  :domain               => "localhost:3000",
  :user_name            => "claire@claritybox.co",
  :password             => "thanksgiving2012",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
end
  ActionMailer::Base.default_url_options[:host] = "localhost:3000"

