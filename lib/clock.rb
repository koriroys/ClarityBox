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

    if ask_at_datetime >= now - 15.minutes && ask_at_datetime < now + 15.minutes
      UserMailer.registration_confirmation(user).deliver  # TODO: Write mailer --> Question email
    end

  end

  # if question.ask_at == DateTime.now


end

# every(4.minutes, 'Queueing interval job') { Delayed::Job.enqueue IntervalJob.new }
# every(1.day, 'Queueing scheduled job', :at => '14:17') { Delayed::Job.enqueue ScheduledJob.new }
