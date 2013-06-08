class UserMailer < ActionMailer::Base
default :from => "Claire Lew <claire@claritybox.co>"

  def employee_invite_request(user, current_user, temp_pass)
    @user = user
    @temp_pass = temp_pass
    @current_user = current_user
    @company = user.company
    mail(
      :to => "#{user.first_name} #{user.last_name} <#{user.email}>",
      :subject => "#{current_user.first_name} invited you to ClarityBox"
       )
  end

  def app_invite_request(app_request)
    @app_request = app_request
    mail(
      :to => "#{app_request.name} <#{app_request.email}>",
      :subject => "Thanks for your invite request!"
       )
  end

  def app_invite_notification(app_request)
    @app_request = app_request
    mail(
      :to => "Claire Lew <claire@claritybox.co>",
      :subject => "App invite request from #{app_request.name}"
      )
  end

  def question_email(user, question)
    @user = user
    @question = question
    @company = user.company
    mail(
      :to => "#{user.first_name} #{user.last_name} <#{user.email}>",
      :subject => "This week's question (#{question.week.start_date.strftime("%B %e")})"
       )
  end

  def reminder_email(user, question)
    @user = user
    @question = question
    @company = user.company
    mail(
      :to => "#{user.first_name} #{user.last_name} <#{user.email}>",
      :subject => "Reminder for #{question.week.start_date.strftime("%B %e")}"
       )
  end
  end

  def rollup_email(user, question)
    @user = user
    @question = question
    @company = user.company
    mail(
      :to => "#{user.first_name} #{user.last_name} <#{user.email}>",
      :subject => "This week's rollup (#{question.week.start_date.strftime("%B %e")})"
       )
  end
  end


end


