class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :week_number
      t.string :week_start
      t.string :week_stop
      t.integer :question_id

      t.timestamps
    end
  end
end
