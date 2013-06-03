class ChangeSettingsColumnNamesinCompanies < ActiveRecord::Migration
  def change
    rename_column :companies, :send_question_date, :send_question_day_of_week
    rename_column :companies, :send_reminder_date, :send_reminder_day_of_week
    rename_column :companies, :send_rollup_date, :send_rollup_day_of_week
  end
end
