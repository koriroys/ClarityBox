class ChangeSendTimesSettingsinCompanies < ActiveRecord::Migration
  def up
    add_column :companies, :send_question_day_of_week, :integer
    add_column :companies, :send_question_time, :time
    add_column :companies, :send_reminder_day_of_week, :integer
    add_column :companies, :send_reminder_time, :time
    add_column :companies, :send_rollup_day_of_week, :integer
    add_column :companies, :send_rollup_time, :time
  end
  def down
    remove_column :companies, :send_question_date, :datetime
    remove_column :companies, :send_question_time, :datetime
    remove_column :companies, :send_reminder_date, :datetime
    remove_column :companies, :send_reminder_time, :datetime
    remove_column :companies, :send_rollup_date, :datetime
    remove_column :companies, :send_rollup_time, :datetime
  end

end
