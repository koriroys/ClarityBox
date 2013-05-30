class AddSendDateTimesToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :send_question_date, :datetime
    add_column :companies, :send_question_time, :datetime
    add_column :companies, :send_reminder_date, :datetime
    add_column :companies, :send_reminder_time, :datetime
    add_column :companies, :send_rollup_date, :datetime
    add_column :companies, :send_rollup_time, :datetime
  end
end
