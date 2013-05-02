# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


week_hashes = [
  { :week_number => "1", :week_start => "March 1", :week_stop => "March 5"},
  { :week_number => "2", :week_start => "March 7", :week_stop => "March 13"},
  { :week_number => "3", :week_start => "March 15", :week_stop => "March 20"},
]

Week.destroy_all
week_hashes.each do |w_hash|
  w = Week.new
  w.week_number = w_hash[:week_number]
  w.week_start = w_hash[:dob]
  w.week_stop = w_hash[:week_stop]
  w.save
end
puts "There are now #{Week.count} rows in the weeks table."


question_hashes = [
  { :question_text => "What are you most proud of?", :week_id => Question.find_by_week_number("1").id },
  { :question_text => "What's your vision for the company'?", :week_id => Question.find_by_week_number("2").id },
  { :question_text => "What frustrates you?", :week_id => Question.find_by_week_number("3").id },

]

Question.destroy_all
question_hashes.each do |q_hash|
  q = Question.new
  q.question_text = q_hash[:question_text]
  q.week_id = q_hash[:week_id]
  q.save
end
puts "There are now #{Question.count} rows in the questions table."




