class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :question_id
      t.text :answer
      t.string :user_name

      t.timestamps
    end
  end
end
