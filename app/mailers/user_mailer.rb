class UserMailer < ActionMailer::Base
default :from => "Claire Lew <claire@claritybox.co>"

  def employee_invite_request(user, temp_pass)
    @user = user
    @temp_pass = temp_pass
    @company = user.company
    # @admin = User.find_by_id(session[:user_id])
    mail(
      :to => "#{user.first_name} #{user.last_name} <#{user.email}>",
      :subject => "Your invitation to ClarityBox",
      # :from => "#{@admin.first_name} #{@admin.last_name} <#{@admin.email}>"
       )
  end

  # def app_invite_request(user)
  # end

  # def question_email(user)
  # end

  # def reminder_email(user)
  # end

  # def rollup_email(user)
  # end


end


