class AddSendQuestionToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :send_question, :boolean
    add_column :questions, :send_reminder, :boolean
    add_column :questions, :send_rollup, :boolean
  end
end
