class AddDefaultValueToShowAttribute < ActiveRecord::Migration
  def change
    change_column :questions, :send_question, :boolean, :default => true
    change_column :questions, :send_reminder, :boolean, :default => true
    change_column :questions, :send_rollup, :boolean, :default => true
  end
end


