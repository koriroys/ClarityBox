class Week < ActiveRecord::Base
  attr_accessible :start_date, :end_date

  has_many :questions

  def self.get_first_week_start_day
    d1 = get_first_day_of_year
    first_monday = d1.beginning_of_week
  end

  def self.get_first_week_end_day
    d1 = get_first_day_of_year
    first_friday = d1.beginning_of_week(:friday) + 1.week
  end

  def self.get_first_day_of_year
    d1 = Date.today.beginning_of_year
  end

end
