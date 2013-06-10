require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

every(30.minutes, 'Check for scheduled email') do
  user = User.find(2)
  now = DateTime.now

  questions = Question.all
    questions.each do |question|
      ask_at_datetime = question.ask_at
      remind_at_datetime = question.remind_at
      send_roll_up_at_datetime = question.send_roll_up_at

      if ask_at_datetime >= now - 15.minutes && ask_at_datetime < now + 15.minutes
        UserMailer.question_email(user, question).deliver
      end

      if remind_at_datetime >= now - 15.minutes && remind_at_datetime < now + 15.minutes
        UserMailer.reminder_email(user, question).deliver
      end

      if send_roll_up_at_datetime >= now - 15.minutes && send_roll_up_at_datetime < now + 15.minutes
        UserMailer.rollup_email(user, question).deliver
      end
    end


end
  # if question.ask_at == DateTime.now


# every(4.minutes, 'Queueing interval job') { Delayed::Job.enqueue IntervalJob.new }
# every(1.day, 'Queueing scheduled job', :at => '14:17') { Delayed::Job.enqueue ScheduledJob.new }
