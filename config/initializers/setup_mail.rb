ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "claritybox.co",
  :user_name            => "claire",
  :password             => "thanksgiving2012  ",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
