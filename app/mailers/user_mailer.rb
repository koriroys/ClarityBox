class UserMailer < ActionMailer::Base
  default :from => "Claire Lew <claire@claritybox.co>"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.first_name} #{user.last_name} <#{user.email}>", :subject => "Welcome to ClarityBox"
      )
  end
end


