require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

every(30.minutes, 'Check for scheduled email') do
  user = User.find(2)
  now = DateTime.now

  questions = Question.all

  questions.each do |question|
    date = question.ask_at.to_date
    hour = question.ask_at.hour
    min = question.ask_at.min

    if date == now.to_date && (hour == now.hour || hour == now.hour - 1.hour || hour == now.hour + 1.hour)
      UserMailer.registration_confirmation(user).deliver # TODO: Write mailers
    end
  end

  # if question.ask_at == DateTime.now


end

# every(4.minutes, 'Queueing interval job') { Delayed::Job.enqueue IntervalJob.new }
# every(1.day, 'Queueing scheduled job', :at => '14:17') { Delayed::Job.enqueue ScheduledJob.new }
