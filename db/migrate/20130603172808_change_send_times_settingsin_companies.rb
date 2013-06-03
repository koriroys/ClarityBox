class ChangeSendTimesSettingsinCompanies < ActiveRecord::Migration
  def change
      change_column :companies, :send_question_date, :integer
      change_column :companies, :send_question_time, :time
      change_column :companies, :send_reminder_date, :integer
      change_column :companies, :send_reminder_time, :time
      change_column :companies, :send_rollup_date, :integer
      change_column :companies, :send_rollup_time, :time
  end
end
