class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question_text
      t.integer :week_id
      t.integer :user_id
      t.integer :company_id
      t.datetime :ask_at
      t.datetime :remind_at
      t.datetime :send_roll_up_at

      t.timestamps
    end
  end
end
