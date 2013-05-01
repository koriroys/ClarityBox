class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question_text
      t.integer :week_id

      t.timestamps
    end
  end
end