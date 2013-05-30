# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

company_hashes = [
      { name: 'Starter League',
        send_question_date: 'Friday',
        send_question_time: '5:00AM',
        send_reminder_date: 'Sunday',
        send_reminder_time: '7:00PM',
        send_rollup_date: 'Tuesday',
        send_rollup_time: '5:00AM',
      },
]

Company.destroy_all
company_hashes.each do |c_hash|
  c = Company.new(c_hash)
  c.save
end
puts "There are #{Company.count} rows in the company table."


user_hashes = [
  { first_name: 'Claire', last_name: 'Lew', user_role: 'Super Admin', company_id: Company.find_by_name('Starter League').id, email: 'clew23@gmail.com', password: 'hi', password_confirmation: 'hi'}
]

User.destroy_all
user_hashes.each do |u_hash|
  u = User.new(u_hash)
  u.save
end
puts "There are #{User.count} rows in the user table."



# week_hash = [
#   { :week_number => "1", :week_start => "March 1", :week_stop => "March 5", :question_id => "1"},
#   { :week_number => "2", :week_start => "March 7", :week_stop => "March 13", :question_id => "2"},
#   { :week_number => "3", :week_start => "March 15", :week_stop => "March 20", :question_id => "3"},
# ]

Week.destroy_all
monday = Week.get_first_week_start_day
friday = Week.get_first_week_end_day
w = Week.new(start_date: monday, end_date: friday)
w.save
51.times do |x|
  monday = monday + 1.week
  friday = friday + 1.week
  w = Week.new(start_date: monday, end_date: friday)
  w.save
end

puts "There are now #{Week.count} rows in the weeks table."


# Week.destroy_all
# week_hashes.each do |w_hash|
#   w = Week.new
#   w.week_number = w_hash[:week_number]
#   w.week_start = w_hash[:week_start]
#   w.week_stop = w_hash[:week_stop]
#   w.question_id = w_hash[:question_id]
#   w.save
# end

week = Week.find_by_end_date(Date.today.beginning_of_week(:friday) + 1.week)
ask_at = week.end_date.to_datetime + 8.hours
remind_at = week.end_date.to_datetime + 2.days + 20.hours
send_roll_up_at = week.end_date.to_datetime + 4.days + 8.hours

question_hashes = [
  { :question_text => "Are you happy here?",
    :week_id => week.id,
    :user_id => User.find_by_email('clew23@gmail.com').id,
    :company_id => Company.find_by_name('Starter League').id,
    :ask_at => ask_at,
    :remind_at => remind_at,
    :send_roll_up_at => send_roll_up_at,
    :send_question => 'true',
    :send_reminder => 'true',
    :send_rollup => 'true'
     },

  { :question_text => "Is there anything unspoken in the company?",
    :week_id => Week.find_by_end_date(week.end_date + 1.week).id,
    :user_id => User.find_by_email('clew23@gmail.com').id,
    :company_id => Company.find_by_name('Starter League').id,
    :ask_at => ask_at + 1.week,
    :remind_at => remind_at + 1.week,
    :send_roll_up_at => send_roll_up_at + 1.week,
    :send_question => 'true',
    :send_reminder => 'true',
    :send_rollup => 'true'
    },

  { :question_text => "Do you feel frustrated by anything?",
     :week_id => Week.find_by_end_date(week.end_date + 2.weeks).id,
    :user_id => User.find_by_email('clew23@gmail.com').id,
    :company_id => Company.find_by_name('Starter League').id,
    :ask_at => ask_at + 2.weeks,
    :remind_at => remind_at + 2.weeks,
    :send_roll_up_at => send_roll_up_at + 2.weeks,
        :send_question => 'true',
    :send_reminder => 'true',
    :send_rollup => 'true'
    },

]


Question.destroy_all
question_hashes.each do |q_hash|
  q = Question.new(q_hash)
  q.save
end
puts "There are now #{Question.count} rows in the questions table."




