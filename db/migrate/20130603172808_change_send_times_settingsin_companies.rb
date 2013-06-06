class ChangeSendTimesSettingsinCompanies < ActiveRecord::Migration
def up
  remove_column :companies, :send_question_day
  remove_column :companies, :send_question_time
  remove_column :companies, :send_reminder_day
  remove_column :companies, :send_reminder_time
  remove_column :companies, :send_rollup_day
  remove_column :companies, :send_rollup_time
  add_column :companies, :send_question_day, :integer
  add_column :companies, :send_question_time, :time
  add_column :companies, :send_reminder_day, :integer
  add_column :companies, :send_reminder_time, :time
  add_column :companies, :send_rollup_day, :integer
  add_column :companies, :send_rollup_time, :time
end


end

