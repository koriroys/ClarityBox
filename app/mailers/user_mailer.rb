class UserMailer < ActionMailer::Base
  default :from => "Claire Lew <claire@claritybox.co>"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.first_name} #{user.last_name} <#{user.email}>", :subject => "Welcome to ClarityBox"
      )
  end

  # def account_invite_request(user)

  # end

  # def app_invite_request(user)
  # end

  # def question_email(user)
  # end

  # def reminder_email(user)
  # end

  # def rollup_email(user)
  # end


end


